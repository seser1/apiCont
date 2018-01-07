require_relative 'spec_helper'

RSpec.describe 'cont_act test' do
    cont_id='000'

    it 'Initialized' do
        contest = Contest.new(cont_id)
    end

end