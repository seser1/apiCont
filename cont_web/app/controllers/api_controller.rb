class ApiController < ApplicationController

  #Return contest's status
  def stat
    @contest = Contest.where(cont_id: params[:id]).first
    render json: @contest.data
  end

  #Update method used with user authentification
  #User name would be handed by using get parameter
  def update    
  end

end
