class WebController < ApplicationController
  def main
    render 'web/top'
  end

  def list
    render 'web/list'
  end

  def cont
    @contests = Contest.all
    render 'web/cont'
  end

  def user
    render 'web/user'
  end


end
