require_relative 'spec_helper'

RSpec.describe 'cont_act test' do
    cont_id='000'

    it 'initializes Contest by test data on DB' do
        contest = Contest.new(cont_id)
        expect(contest.instance_variable_get(:@users)).to match_array(['user1','user2'])
    end
end