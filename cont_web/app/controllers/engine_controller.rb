class EngineController < ApplicationController
#  protect_from_forgery :except => [:run]

  def main
    render 'engine/main'
  end
    
end
