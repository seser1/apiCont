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
    @input=JSON.parse(input, {:symbolize_names => true}) 

    @data[:count1]+=1

    @input.each{|k, v|@data[:count2]+=v[:change]}
  end

end