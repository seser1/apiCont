class ApiController < ApplicationController

  #Return json formatted contest's status
  def stat
    @contest = Contest.where(cont_id: params[:id]).first
    render json: @contest.data
  end

  #Update method used with user authentification
  #User name would be handed by using get parameter
  #Parameter 
  # name : user name
  # input : input from user (formatted as json)
  # token : user authentify token
  def update
    name=params[:name]
    input=params[:input]

    token=params[:token]

    
  end

end
