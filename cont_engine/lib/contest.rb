require 'sqlite3'

#$db_pass='../../cont_web/db/development.sqlite3'
$db_pass=File.expand_path(File.dirname(__FILE__) + './../../cont_web/db/development.sqlite3')

class Contest
  def initialize(cont_id)
    @cont_id=cont_id

    #If there already exists dbfile, open the file (not overwritten)
    db = SQLite3::Database.new $db_pass
      db.results_as_hash = true
      db.execute("SELECT * FROM contests WHERE cont_id == '#{@cont_id}'") do |row|
        @term=row['term']
        @users=JSON.parse(row['users'], {:symbolize_names => true}) 
      end
    db.close

    @contest=init_cont()

    @run_flag=true
  end

  def init_cont()
    #Create contest instance and initialize it 
  end

  def run
    index=0

    while @run_flag
      @calc_thread=Thread.start {
        puts "calc_thread#{index} start"
        calc
        puts "calc_thread#{index} end"
      }

      @db_thread=Thread.start {
        #db_thread starts 3/4 delayed from calc_thread
        sleep((@term/1000)*3/4)
        puts "db_thread#{index} start"
        update_db
        puts "db_thread#{index} end"
      }

      sleep(@term/1000)
      index+=1
    end
  end

  def update_db

    db = SQLite3::Database.new $db_pass
      db.execute("SELECT int_param FROM contests WHERE cont_id == '#{@cont_id}'") do |row|
        $i=row[0]
      end
      p $i
      db.execute("UPDATE contests SET int_param =? WHERE cont_id == '#{@cont_id}'", $i+1)
    db.close
  end

  def calc
  end

end
