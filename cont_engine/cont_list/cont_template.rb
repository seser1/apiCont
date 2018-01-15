require 'json'

class ContestTemplate
  def initialize(users)
    @data_template={}
    @input_template={}

    @data={}
    @users=users
    @view=nil
    @input=nil
  end

  def next(input)
    #input is json format data
    @input=JSON.parse(input, {:symbolize_names => true}) 
    logic

    #Return true if contest continues
    #Return false when contest ends
    return continue?
  end

  def get_struct
    return JSON.generate(@data)
  end

  def get_view
    return @view
  end

  def logic
    #Write logic here
  end

  def continue?
    #Write continuing basis
  end

end