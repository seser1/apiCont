require_relative 'spec_helper'

RSpec.describe 'cont_manager test' do
  user = ['user1', 'user2']
 
  it 'initializes Cont000' do
    cont = ContManager.get_instance('Cont000',user,nil)
    hs=JSON.parse(cont.get_struct, {:symbolize_names => true})
    expect(hs[:count1]).to eq 0
    expect(hs[:count2]).to eq 0
  end

end