require 'json'
require_relative './cont_template'


class Cont000 < ContestTemplate
  def initialize(user_info, logger=nil)
    @data_template={:count1 => 0, :count2 => 0}
    @input_template={:change => nil}

    @data=@data_template.dup
    @user_info=user_info
    @view=nil
    @input=nil

    @run_flag=true

    #Create logger instance if not exists
    @logger = logger || Logger.new(STDERR)
    @logger.debug 'Cont000: Initialization finished'
  end

  def logic
    @logger.debug 'Cont000: execute logic'

    #Contest logic
    @data[:count1]+=1
    @input.each{|k, v|@data[:count2]+=v[:change]}
    @view="count1: #{@data[:count1]} count2: #{@data[:count2]}";
    #Logic end
  end

  def update_stat
    @logger.debug 'Cont000: execute update_stat'
    @run_flag=false if @data[:count1]>=5
  end

end