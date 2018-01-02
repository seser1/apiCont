require './classes/cont_act.rb'

$cont_id='00001'

#Executed from job controller
contest = Contest.new($cont_id)
contest.run

