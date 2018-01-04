require_relative 'spec_helper'

RSpec.describe 'Cont000 test' do
    user = ['user1', 'user2']
 
    it 'Initialized' do
        cont = Cont000.new(user)
        expect(cont.get_struct).to eq '{"count1":0,"count2":0}'
    end
    
    it 'Execute next one time' do
      cont = Cont000.new(user)
      cont.next({"user1": 10,"user2": -5})
      expect(cont.get_struct).to eq '{"count1":1,"count2":6}'
    end

end