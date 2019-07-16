class UsersController < ApplicationController

  get "/signup" do
    if !is_logged_in?
      erb :"/users/signup"
    else
      redirect to "/vacations"
    end
  end

  post "/signup" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "You must provide a username, email and password.  Please try again."
      redirect to "/signup"
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to "/vacations"
    end
  end

  get "/login" do
    if !is_logged_in?
      erb :"/users/login"
    else
      redirect to "/vacations/vacations"
    end
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/vacations"
    else
      flash[:message] = "Invalid username or password.  Please try again."
      redirect to '/login'
    end
  end

  get "/logout" do
    if is_logged_in?
      session.destroy
      redirect to "/"
    else
      redirect to "/"
    end
  end

end
