class StaticPagesController < ApplicationController
  def home
  	@xcoder = current_user.x_coders.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
