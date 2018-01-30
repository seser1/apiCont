require 'date'
require 'logger'
require './lib/contest.rb'


#cont_id are given by using arguments when execute
cont_id=ARGV[0]

#Create logger instance used in classes
logger = Logger.new("./log/#{DateTime.now.strftime("%Y%m%d%H%M%S")}_#{cont_id}.log")
logger.level = ARGV[1]=='-d' ?  Logger::DEBUG :  Logger::INFO

logger.info "Start to execute engine: cont_id = #{cont_id}"

#Executed from job controller
begin
    contest = Contest.new(cont_id, logger)
    contest.run
rescue => e
  s="Contest stopped: Detected Exception - #{e.message}"
  puts s
  logger.error s
end
