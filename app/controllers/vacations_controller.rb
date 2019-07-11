class VacationsController < ApplicationController

  # GET: /vacations
  get "/vacations" do
    erb :"/vacations/index.html"
  end

  # GET: /vacations/new
  get "/vacations/new" do
    erb :"/vacations/new.html"
  end

  # POST: /vacations
  post "/vacations" do
    redirect "/vacations"
  end

  # GET: /vacations/5
  get "/vacations/:id" do
    erb :"/vacations/show.html"
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
