Dir[File.join(File.dirname(__FILE__), "../cont_list/*.rb")].each { |f| require f }

module ContManager
  #ContManager helps Contest to get target contest's instance

  #Changed to store 'targes contest's class name' same name to 'contest type registered in db'
  #Considering about maintainance cost

  #Return target contest's instance initialized by user_info
  def get_instance(cont_type, user_info, logger=nil)
    logger = logger || Logger.new(STDERR)
    logger.info 'ContManager :get_instance'

    return Module.const_get(cont_type).new(user_info, logger)
  end

  module_function :get_instance
end


