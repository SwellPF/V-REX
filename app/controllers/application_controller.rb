require './config/environment'
require 'sinatra/flash'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "cinoman_spice"
    register Sinatra::Flash
  end

  get "/" do
    erb :'/users/index'
  end

  helpers do
    def current_user
      @user = User.find_by_id(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end
  end

end
