require 'rack-flash'

class VacationsController < ApplicationController
  use Rack::Flash

  # GET: /vacations
  get "/vacations" do
    if is_logged_in?
      @vacations = Vacation.all
      erb :"/vacations/index.html"
    else
      flash[:message] = "You must be logged in to create, edit or view vacation recommendations."
      redirect to "/login"
    end
  end

  # GET: /vacations/new
  get "/vacations/new" do
    if is_logged_in?
      erb :"/vacations/new.html"
    else
      flash[:message] = "You must be logged in to create vacation recommendations."
      redirect to "/login"
    end
  end

  # POST: /vacations
  post "/vacations" do
    if is_logged_in?
      # if conditional to make sure that all required fields are present
          redirect to "/vacations/new"
    else
      @vacation = current_user.vacations.new(params)
      if @vacation.save
        redirect to "/vacations/#{vacation.id}"
      else
        flash[:message]= "Error creating vacation recommendation.  Please try again."
        redirect to "/vacations/new"
      end
    else
      flash[:message] = "You must be logged in to create or view vacation recommendations."
      redirect to "/login"
    end

  # GET: /vacations/5
  get "/vacations/:id" do
    if is_logged_in?
      @vacation = Vacation.find_by(params[:id])
      erb :"/vacations/show.html"
    else
      redirect to "/login"
    end
  end

  # GET: /vacations/5/edit
  get "/vacations/:id/edit" do
    erb :"/vacations/edit.html"
  end

  # PATCH: /vacations/5
  patch "/vacations/:id" do
    redirect "/vacations/:id"
  end

  # DELETE: /vacations/5/delete
  delete "/vacations/:id/delete" do
    redirect "/vacations"
  end
end
