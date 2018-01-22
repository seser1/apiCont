require_relative 'spec_helper'

RSpec.describe 'contest test' do
  cont_id='cont_000'

  it 'initializes Contest by test data on DB' do
    contest = Contest.new(cont_id)
    expect(contest.instance_variable_get(:@users)).to match_array(['user1','user2'])
  end
end