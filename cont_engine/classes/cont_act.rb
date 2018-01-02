require 'sqlite3'

#$db_pass='../../cont_web/db/development.sqlite3'
$db_pass=File.expand_path(File.dirname(__FILE__) + './../../cont_web/db/development.sqlite3')

class Contest
  def initialize()
    #If there already exists dbfile, open the file (not overwritten)
    db = SQLite3::Database.new $db_pass
      db.results_as_hash = true
      db.execute("SELECT * FROM cont_data WHERE cont_id == '00001'") do |row|
        @term=row['term']
      end
    db.close

    @run_flag=true
    

    @db_thread=nil
    @calc_thread=nil
  end

  def run

    @db_thread=Thread.start {
      while @run_flag
        puts "db_thread"
        @calc_thread=Thread.start {  
          sleep(@term/3000)
          puts "calc_thread1"
          sleep(@term/3000)
          puts "calc_thread2"
        }

        sleep(@term/1000)
        update_db
      end
    }

    @db_thread.join
  end

  def update_db

    db = SQLite3::Database.new $db_pass
      db.execute("SELECT int_param FROM cont_data WHERE name == 'testContest'") do |row|
        $i=row[0]
      end
      p $i
      db.execute("UPDATE cont_data SET int_param =?  WHERE name == 'testContest'", $i+1)
    db.close
  end
end
