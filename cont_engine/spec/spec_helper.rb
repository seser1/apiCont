Dir[File.join(File.dirname(__FILE__), "../lib/*.rb")].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), "../contests/*.rb")].each { |f| require f }

