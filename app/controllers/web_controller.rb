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
    @contest = Contest.where(cont_id: params[:id]).first
    render 'web/cont'
  end

  def user
    render 'web/user'
  end


end
