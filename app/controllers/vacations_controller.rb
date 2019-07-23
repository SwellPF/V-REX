#require 'rack-flash'

class VacationsController < ApplicationController
  

  # GET: /vacations
  get "/vacations" do
    if is_logged_in?
      @vacations = Vacation.all
      erb :"/vacations/index"
    else
      flash[:message] = "You must be logged in to create, edit or view vacation recommendations."
      redirect to "/login"
    end
  end

  # GET: /vacations/new
  get "/vacations/new" do
    if is_logged_in?
      erb :"/vacations/new"
    else
      flash[:message] = "You must be logged in to create vacation recommendations."
      redirect to "/login"
    end
  end

  # POST: /vacations
  post "/vacations" do
    if is_logged_in?
      if params[:location_name] == "" || params[:description] == "" || params[:reason] == "" || params[:best_time] == "" || params[:photo_link] == ""
        flash[:message]= "All fields are required.  Please try again."
        redirect to "/vacations/new"
      else 
        @vacation = current_user.vacations.new(location_name: params[:location_name], description: params[:description], best_time: params[:best_time], reason: params[:reason], photo_link: params[:photo_link])
      end
      
      if @vacation.save
        redirect to "/vacations/#{@vacation.id}"
      else
        flash[:message]= "Error creating vacation recommendation.  Please try again."
        redirect to "/vacations/new"
      end
    else
      flash[:message] = "You must be logged in to create or view vacation recommendations."
      redirect to "/login"
    end
  end

  # GET: /vacations/5
  get "/vacations/:id" do
    if is_logged_in?
      @vacation = Vacation.find_by_id(params[:id])
      erb :"/vacations/show"
    else
      flash[:message] = "You must be logged in to view vacation recommendations."
      redirect to "/login"
    end
  end

  # GET: /vacations/5/edit
  get "/vacations/:id/edit" do
    if is_logged_in?
      @vacation = Vacation.find_by_id(params[:id])
      if @vacation && @vacation.user == current_user
        erb :"/vacations/edit"
      else
        flash[:message] = "You may only edit entries created by you."
        redirect to "/vacations"
      end
    else
      flash[:message] = "You must be logged in to edit vacation recommendations."
      redirect to "/login"
    end  
  end

  # PATCH: /vacations/5
  patch "/vacations/:id" do
    if is_logged_in?
      if params[:location_name] == "" || params[:description] == "" || params[:reason] == "" || params[:best_time] == "" || params[:photo_link] == ""
        redirect to "/vacations/#{params[:id]}/edit"
      else
      @vacation = Vacation.find_by_id(params[:id])
      end
      if @vacation && @vacation.user == current_user
        if @vacation.update(location_name: params[:location_name], description: params[:description], best_time: params[:best_time], reason: params[:reason], photo_link: params[:photo_link])
          redirect to "/vacations/#{@vacation.id}"
        else
          redirect to "/vacations/#{@vacation.id}/edit"
        end
      else
        redirect to "/vacations"
      end
    else
      redirect to "/login"
    end    
  end

  # DELETE: /vacations/5/delete
  delete "/vacations/:id/delete" do
    if is_logged_in?
      @vacation = Vacation.find_by_id(params[:id])
      if @vacation && @vacation.user == current_user
        @vacation.delete
      else
        flash[:message] = "You can only delete entries created by you."
      end
      redirect to "/vacations"
    else
      flash[:message] = "You must be logged in to delete vacation recommendations."
      redirect to "/login"
    end
  end
end
