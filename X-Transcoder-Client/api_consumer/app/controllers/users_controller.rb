class UsersController < ApplicationController
  require 'rest_client'

  USERNAME = "haha@haha.com	" # needed to access the APi
  PASSWORD = "111111" # needed to access the APi
  API_BASE_URL = "http://localhost:3000/" # base url of the API

  def index
     flash[:success] = " :) Welcome to the X-Transcoding!"
	
  end
  
  def new
  end
  
  def show
  
    uri = "#{API_BASE_URL}/users.json" # specifying json format in the URl 
	rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD) # It will create new rest-client resource so that we can call different methods of it
    users = rest_resource.get # will get back you all the detail in json format, but it will we wraped as string, so we will parse it in the next step.
    @users = JSON.parse(users, :symbolize_names => true) # we will convert the return data into array of hash.see json data parsing here

  end
  
end
