Dir[File.join(File.dirname(__FILE__), "../cont_list/*.rb")].each { |f| require f }

module ContManager
  #Help Contest to get target contest's instance

#Changed to store 'targes contest's class name' same name to 'contest type registered in db'
#Considering about maintainance cost
=begin
  #Lists of hash 'contest type registered in db' and 'target contest's class name'
  $cont_list={
    "000" => "Cont000"
  }
=end

  #Return target contest's instance initialized by user_info
  def get_instance(cont_type, user_info)
    return Module.const_get(cont_type).new(user_info)
  end

  module_function :get_instance
end


