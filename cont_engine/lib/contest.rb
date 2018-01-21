require 'sqlite3'
require 'cont_manager'

#Related path of db file
$db_path=File.expand_path(File.dirname(__FILE__) + './../../cont_web/db/development.sqlite3')

class Contest
  def initialize(cont_id)
    @cont_id=cont_id

    #If there already exists dbfile, open the file (not overwritten)
    db = SQLite3::Database.new $db_path
      db.results_as_hash = true
      db.execute("SELECT * FROM contests WHERE cont_id == '#{@cont_id}'") do |row|
        @term=row['term']
        @users=JSON.parse(row['users'], {:symbolize_names => true}) 
      end
    db.close

    @contest=init_cont()
  end

  def init_cont()
    return ContManager.get_instance(@cont_id,@users)
  end

  def run
    index=0

    #At the first turn, no thread executed. So sleep once
    sleep(@term/1000)

    #Main loop of contest
    while @contest.run_flag
      #At the beggining of turn, backup current data
      #Because update_db must use latest turn's data
      @data_out = @contest.get_struct
      @view_out = @contest.get_view

      #db_thread starts immediately after backup
      @db_thread=Thread.start {
        puts "db_thread#{index} start"
        update_db
        puts "db_thread#{index} end"
      }

      #calc_thread starts immediately after backup
      @calc_thread=Thread.start {
        puts "calc_thread#{index} start"
        calc
        puts "calc_thread#{index} end"
      }

      sleep(@term/1000)
      index+=1
    end
  end

  def update_db
    db = SQLite3::Database.new $db_path
      db.execute("UPDATE contests SET data =? view =? WHERE cont_id == '#{@cont_id}'", @data_out, @view_out)
    db.close
  end

  def calc
    @contest.logic
  end

end
