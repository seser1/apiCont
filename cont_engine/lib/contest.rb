require 'sqlite3'
require 'logger'
require 'active_support/core_ext/integer/inflections'
require_relative './cont_manager.rb'

#Related path of db file
$db_path=File.expand_path(File.dirname(__FILE__) + './../../cont_web/db/development.sqlite3')

class Contest < Exception
  def initialize(cont_id, logger=nil)
    @cont_id=cont_id

    #Create logger instance (STDERR) if not exists
    @logger = logger || Logger.new(STDERR)
    @logger.debug 'Contest: Start to initializing'
    SQLite3::Database.new $db_path do |db|
      db.results_as_hash = true
      db.execute("SELECT * FROM contests WHERE cont_id = '#{@cont_id}'") do |row|
        @cont_type=row['cont_type']
        @term=row['term']
        @users=JSON.parse(row['users'], {:symbolize_names => true})
      end
    end

    @logger.error 'There is no data in Database' if @cont_type == nil 

    @contest=init_cont()

    @logger.debug 'Contest: Initialization finished'
  rescue => e
    #Return error with comment in order to detect error place
    raise StandardError, "Exception occured while initializing Contest: #{e.message}"
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
      @logger.info "Contest: ------ #{index.ordinalize} turn starts ------"

      #At the beggining of turn, backup current data
      #Because update_db must use latest turn's data

      @data_out = @contest.get_struct.to_s
      @view_out = @contest.get_view.to_s
      
      @logger.info "Contest: @data : #{@data_out}"
      @logger.info "Contest: @view : #{@view_out}"

      #thread starts immediately after backup
      @thread=Thread.start {
        #In thread, execute calc firstly
        #update_db will be executed immediately after finishing calc
        @logger.debug "Contest: thread#{index} start"

        @logger.debug "Contest: get_input start"
        get_input

        @logger.debug "Contest: calc start"
        calc

        @logger.debug "Contest: update_db start"
        update_db

        @logger.debug "Contest: thread#{index} end"
      }

      sleep(@term/1000)
      index+=1
    end

    @logger.info 'Contest: Contest ends'
    rescue => e
    raise StandardError, "Exception occured while running Contest: #{e.message}"
  end

  def get_input
    SQLite3::Database.new $db_path do |db|
      db.results_as_hash = true
      db.execute("SELECT * FROM contests WHERE cont_id = '#{@cont_id}'") do |row|
        @input=row['inputs']
      end
      @logger.error 'Contest: inputs are nil' if @input==nil
    end
  end

  def calc
    @contest.next(@input)
  end

  def update_db

    SQLite3::Database.new $db_path do |db|
      db.transaction do
        db.execute("UPDATE contests SET data=?, view=? WHERE cont_id=?", [@data_out, @view_out, @cont_id])
      end
    end

  rescue => e
    #Write error to logger here. 
    #Because 'raise' here won't be rescued at 'run' because the thread is independent
    @logger.error 'Contest: inputs are nil' if @input==nil
    @logger.error "update_db: #{e.message}"
  end

end
