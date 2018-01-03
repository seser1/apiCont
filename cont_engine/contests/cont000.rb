require 'json'
require_relative './cont_template'


class Cont000 < ContestTemplate
  def initialize(user_info)
    @data_template={:count1 => 0, :count2 => 0}
    @input_template={:change => nil}

    @data=@data_template.dup
    @user_info=user_info
    @view=nil
  end

  def next(input)
    #input is json format data
    @input=JSON.load(input) 
  end

end