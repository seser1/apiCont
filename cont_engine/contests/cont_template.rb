require 'json'

class ContestTemplate
  def initialize(user_info)
    @data={}
    @user_info=user_info
    @view=nil
  end

  def next(input)
  end

  def get_struct
    return json.generate(@data)
  end

  def get_view
    return @view
  end

end