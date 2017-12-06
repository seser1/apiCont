class WebController < ApplicationController
  def main
    render 'web/top'
  end

  def list
    render 'web/list'
  end

  def cont
    render 'web/cont'
  end

  def user
    render 'web/user'
  end


end
