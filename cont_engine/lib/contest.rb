require 'sqlite3'
require 'logger'
require_relative './cont_manager.rb'

#Related path of db file
$db_path=File.expand_path(File.dirname(__FILE__) + './../../cont_web/db/development.sqlite3')

class Contest
  def initialize(cont_id, logger=nil)
    @cont_id=cont_id

    #Create logger instance (STDERR) if not exists
    @logger = logger || Logger.new(STDERR)
    @logger.debug 'Contest: Start to initializing'

    #If there already exists dbfile, open the file (not overwritten)
    db = SQLite3::Database.new $db_path
      db.results_as_hash = true
      db.execute("SELECT * FROM contests WHERE cont_id == '#{@cont_id}'") do |row|
        @cont_type=row['cont_type']
        @term=row['term']
        @users=JSON.parse(row['users'], {:symbolize_names => true})
      end
    db.close
    @logger.error 'There is no data in Database' if @cont_type == nil 

    @contest=init_cont()

    @logger.debug 'Contest: Initialization finished'
  end

  def init_cont()
    return ContManager.get_instance(@cont_type,@users,@logger)
  end

  def run
    index=0

    @logger.info 'Contest: contest starts'

    #At the first turn, no thread executed. So sleep once
    sleep(@term/1000)

    #Main loop of contest
    while @contest.run_flag
      #At the beggining of turn, backup current data
      #Because update_db must use latest turn's data
      @data_out = @contest.get_struct
      @view_out = @contest.get_view

      #thread starts immediately after backup
      @thread=Thread.start {
        #In thread, execute calc firstly
        #update_db will be executed immediately after finishing calc
        @logger.debug "Contest: thread#{index} start"
        @logger.debug "Contest: get_input start"
        get_input
        @logger.debug "Contest: get_input end"
        @logger.debug "Contest: calc start"
        calc
        @logger.debug "Contest: calc end"
        @logger.debug "Contest: update_db start"
        update_db
        @logger.debug "Contest: update_db end"
        @logger.debug "Contest: thread#{index} end"
      }

      sleep(@term/1000)
      index+=1
    end

    @logger.info 'Contest: Contest ends'
  end

  def get_input
    @input=nil
  end

  def calc
    @contest.next(@input)
  end

  def update_db
    db = SQLite3::Database.new $db_path
      db.execute("UPDATE contests SET data ='#{@data_out}' view ='#{@view_out}' WHERE cont_id == '#{@cont_id}'")
    db.close
  end

end
