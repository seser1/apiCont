require 'json'

class ContestTemplate
  def initialize(user_info)
    @data_template={}
    @input_template={}

    @data={}
    @user_info=user_info
    @view=nil
  end

  def next(input)
    #input is json format data
    @input=JSON.load(input) 
  end

  def get_struct
    return JSON.generate(@data)
  end

  def get_view
    return @view
  end

end