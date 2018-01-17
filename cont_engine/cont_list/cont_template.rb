require 'json'

class ContestTemplate
  attr_accessor :run_flag

  def initialize(users)
    @data_template={}
    @input_template={}

    @data={}
    @users=users
    @view=nil
    @input=nil

    @run_flag=true
  end

  def next(input)
    #input is json format data
    @input=JSON.parse(input, {:symbolize_names => true}) 
    logic

    #Update @run_flag
    continue?
  end
  
  def logic
    #Write logic here
  end

  def continue?
    #Write continuing basis
  end

  #--Methods below aren't considered to be updated at inheriting class--

  def get_struct
    return JSON.generate(@data)
  end

  def get_view
    return @view
  end

end