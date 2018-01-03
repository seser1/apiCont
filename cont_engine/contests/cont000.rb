require 'json'

class cont000
  def initialize()
    @data={:count1 => 0, :count2 => 0}
    @view=nil
  end

  def next

  end

  def get_struct
    return json.generate(@data)
  end

  def get_view
    return @view
  end

end