class HomeController < ApplicationController

  ## this controller helps create routing to static pages

  def show
    render :action => params[:page]
  end

end