class XCoderController < ApplicationController
  before_action :signed_in_user
  def new
  	@xcoder = XCoder.new
  end

  def index
  end

  def create
  	@xcoder = current_user.xcoder.build(xcoder_params)
  	if @xcoder.save
  		flash[:success] = "Xcoder created!"
  		redirect_to root_url
  	else
  		render 'static_pages/home'
  	end
  end

  def destroy
  end
end
