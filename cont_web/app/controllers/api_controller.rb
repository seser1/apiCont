class ApiController < ApplicationController

  #Return json formatted contest's status
  #Parameter 
  # id : user name (if necessary)
  def stat
    cont_id=params[:cont_id]

    user=params[:user]
    token=params[:token]
    # user : user name (if necessary)
    # User should be used with token

    @contest = Contest.find_by(cont_id: cont_id)
    render json: @contest.data
  end

  #Update method used with user authentification
  #User name would be handed by using get parameter
  #Parameter 
  # user : user name
  # input : input from user (formatted as json)
  # token : user authentify token
  def update
    cont_id=params[:cont_id]

    user_id=params[:user]
    input=params[:input]

    token=params[:token]

    @row=UcRelate.where(cont_id: cont_id, user_id: user_id).first
    @row.update(input: input, login_token: token)


    render json: {:user_id => user_id, :input => input}
    #Should return error code when wrong parameters are posted
  end

end
