require 'json'
require 'logger'

class ContestTemplate
  attr_reader :run_flag

  #Initializer may be overridden in inheriting class
  #But then, variable defined here should be defined in inheriting class
  def initialize(users, logger=nil)
    #Hash which describes data format send to user
    @data_template={}
    #Hash which describes input json format from cont_web (also from user)
    @input_template={}

    #Hash which contains data used in contest by user
    @data={}

    #Hash which contains users information
    @users=users
    #Html text which displays contest status (send to cont_web)
    @view=nil
    #Input from user in current turn
    @input=nil

    #flag which decide the contest's continuation
    @run_flag=true

    #Create logger instance (STDERR) if not exists
    @logger = logger || Logger.new(STDERR)
  end
  
  def logic
    #Write contest's logic here
  end

  def update_view
    #Write code which generates latest @view
  end
  
  def update_stat
  #Write code which updates @run_flag
  end

  #--Methods below aren't considered to be updated at inheriting class--

  def next(input)
    #input is json format data
    #@input=JSON.parse(input, {:symbolize_names => true})
    @input=input

    @logger.debug 'Cont_temp: Start logic'
    #Contest's main logic
    logic

    #Update @view
    update_view
    #Update @run_flag
    update_stat
  end

  def get_struct
    return JSON.generate(@data)
  end

  def get_view
    return @view
  end

end