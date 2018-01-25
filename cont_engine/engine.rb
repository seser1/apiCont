require './lib/contest.rb'


#cont_id are given by using arguments when execute
cont_id=ARGV[0]

#Executed from job controller
contest = Contest.new(cont_id)
contest.run
