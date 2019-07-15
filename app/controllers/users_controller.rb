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
      #flash[:message] = "You must enter a valid username, email address and password to sign up."
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
      binding.pry
      redirect to "/vacations/vacations"
    end
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])
    binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      binding.pry
      redirect to "/vacations"
    else
      #flash[:message] = "Invalid username or password.  Please try again."
      binding.pry
      redirect to '/login'
    end
  end

  get "/logout" do
    if is_logged_in?
      session.destroy
      redirect to "/login"
    else
      redirect to "/"
    end
  end



  # GET: /users
  #get "/users" do
  #erb :"/users/index.html"
  #end

  # GET: /users/new
  #get "/users/new" do
  #  erb :"/users/new.html"
  #end

  # POST: /users
  #post "/users" do
  #  redirect "/users"
  #end

  # GET: /users/5
  #get "/users/:id" do
  #  erb :"/users/show.html"
  #end

  # GET: /users/5/edit
  #get "/users/:id/edit" do
  #  erb :"/users/edit.html"
  #end

  # PATCH: /users/5
  #patch "/users/:id" do
  #  redirect "/users/:id"
  #end

  # DELETE: /users/5/delete
  #delete "/users/:id/delete" do
  # redirect "/users"
  #end
end
