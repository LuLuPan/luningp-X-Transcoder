class XCoderController < ApplicationController
  before_action :signed_in_user
  def new
  	@xcoder = XCoder.new
  end

  def index
  end

  def create
  	@xcoder = current_user.x_coders.build(xcoder_params)
  	if @xcoder.save
  		flash[:success] = "Xcoder created!"
  		redirect_to root_url
  	else
  		render 'static_pages/home'
  	end
  end

  def destroy
  end

  def upload
    uploaded_io = params[:stream][:user_id]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
  end

  private

    def xcoder_params
      params.require(:xcoder).permit(:stream, :format)
    end
end
