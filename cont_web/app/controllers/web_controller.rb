class WebController < ApplicationController
  layout 'web_main'

  def main
    @contests = Contest.all
    render 'web/top'
  end

  def conf
    @contests = Contest.all
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
