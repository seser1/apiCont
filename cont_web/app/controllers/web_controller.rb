require_relative '../jobs/contexec_job.rb'

class WebController < ApplicationController
  layout 'web_main'

  def main
    @contests = Contest.all
    render 'web/top'
  end

  def conf
    #Write here the registering process of contest as a job
    ContexecJob.delay(run_at: 1.minutes.from_now).exec('cont_000')

    render 'web/conf'
  end

  def cont
    @contest = Contest.where(cont_id: params[:id]).first
    render 'web/cont'
  end

  def user
    render 'web/user'
  end


end
