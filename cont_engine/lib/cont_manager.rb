Dir[File.join(File.dirname(__FILE__), "../cont_list/*.rb")].each { |f| require f }

module ContManager
  #Help Contest to get target contest's instance

  #Lists of hash 'contest id registered in db' and 'target contest's class name'
  $cont_list={
    "000" => "Cont000"
  }

  #Return target contest's instance initialized by user_info
  def get_instance(cont_id, user_info)
    return Module.const_get($cont_list[cont_id]).new(user_info)
  end

  module_function :get_instance
end


