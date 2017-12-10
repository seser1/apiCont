class WebController < ApplicationController
  layout 'web_main'

  def main
    render 'web/top'
  end

  def list
    @contests = Contest.all
    render 'web/list'
  end

  def cont
    para=params[:id]
    @contest = Contest.where(cont_id: para).first
#    @contest = Contest.find(:first, :conditions => {:cont_id => para})
    render 'web/cont'
  end

  def user
    render 'web/user'
  end


end
