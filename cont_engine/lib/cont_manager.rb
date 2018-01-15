Dir[File.join(File.dirname(__FILE__), "../cont_list/*.rb")].each { |f| require f }

module ContManager
  
  $cont_list={
    "000" => "Cont000"
  }

  def get_instance(cont_id, user_info)
    return Module.const_get($cont_list[cont_id]).new(user_info)
  end

  module_function :get_instance
end


