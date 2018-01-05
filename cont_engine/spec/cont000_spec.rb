require_relative 'spec_helper'
require 'json'

RSpec.describe 'Cont000 test' do
    user = ['user1', 'user2']
 
    it 'Initialized' do
        cont = Cont000.new(user)
        hs=JSON.parse(cont.get_struct, {:symbolize_names => true})
        expect(hs[:count1]).to eq 0
        expect(hs[:count2]).to eq 0
    end
    
    it 'Execute next() onetime' do
      cont = Cont000.new(user)
      cont.next('{"user1":{"change":10},"user2":{"change":-5}}')
      hs=JSON.parse(cont.get_struct, {:symbolize_names => true})
      expect(hs[:count1]).to eq 1
      expect(hs[:count2]).to eq 5
    end

end