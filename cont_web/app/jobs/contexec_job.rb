#The job for executing contest
#Supposed to be used with delayed_job
#Executing date and time should be set when this job is registered to delayed_job

$BATCH_PATH='../cont_engine/engine.rb'

module ContexecJob
  def exec(cont_id)
#    target_path=File.expand_path('../cont_engine/', __FILE__)

    spawn "ruby #{$BATCH_PATH} #{cont_id}"
  end

  module_function :exec
end