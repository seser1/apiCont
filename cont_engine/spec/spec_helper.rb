Dir[File.join(File.dirname(__FILE__), "../lib/*.rb")].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), "../cont_list/*.rb")].each { |f| require f }

=begin
RSpec.configure do |config|
  config.before do |example|
    p example.description
  end
end
=end