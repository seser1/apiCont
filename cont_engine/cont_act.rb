require 'sqlite3'

$db_pass='../cont_web/db/development.sqlite3'

class Contest
  def initialize
    @term=3000
    @db_thread=nil
    @calc_thread=nil
  end

  def run
    @db_thread=Thread.start {
      while true
        puts "db_thread"
        update_db
        sleep(@term/1000)
      end
    }
    @calc_thread=Thread.start {
      while true
        puts "calc_thread"
        sleep(@term/3000)
      end
    }

    @db_thread.join
  end

  def update_db
    db_text1="SELECT int_param FROM cont_data WHERE cont_name == 'testContest'"
    db_text2="UPDATE cont_data SET int_param =?  WHERE cont_name == 'testContest'"

    #If there already exists dbfile, open the file (not overwritten)
    db = SQLite3::Database.new $db_pass
      p db.execute(db_text1)
      i= db.execute(db_text1)
      db.execute(db_text2, i[0][0]+1)
    db.close
  end
end
