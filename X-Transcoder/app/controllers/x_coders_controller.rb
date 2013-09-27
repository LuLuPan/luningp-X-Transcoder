class XCodersController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  def new
  	@xcoder = XCoder.new
  end

  def create
  	@xcoder = current_user.x_coders.build(xcoder_params)
    respond_to do |format|
  	if @xcoder.save
  		flash[:success] = "Xcoder created!"
      format.html {redirect_to root_url}
      format.js {}

  	else
      format.js {render 'new'}
    end
      end
  end

  def index
    @x_coders = current_user.x_coders
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
