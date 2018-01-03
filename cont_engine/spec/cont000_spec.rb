require_relative 'spec_helper'

RSpec.describe 'Cont000' do
  it "initializing" do
    user = ['user1', 'user2']
    cont = Cont000.new(user)
#    cont.next()
    expect(cont.get_view).to eq nil
  end
end