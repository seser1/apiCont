require_relative 'spec_helper'

RSpec.describe 'cont_act test' do
    cont_id='000'
    users = ['user1', 'user2']

    it 'Initialized' do
        contest = Contest.new(cont_id, users)
        expect(cont.calc).to eq nil
    end

end