require 'json'
require_relative './cont_template'

class Cont000 < ContestTemplate
  def initialize(user_info)
    @data={:count1 => 0, :count2 => 0}
    @user_info=user_info
    @view=nil
  end

  def next(input)

  end

end