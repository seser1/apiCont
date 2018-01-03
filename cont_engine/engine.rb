require './lib/cont_act.rb'

$cont_id='000'

#Executed from job controller
contest = Contest.new($cont_id)
contest.run
