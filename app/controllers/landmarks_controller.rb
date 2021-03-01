class LandmarksController < ApplicationController
  get '/landmarks' do    #read - shows index page for landmarks 
      @landmarks = Landmark.all 
      @figures = Figure.all
      erb :'landmarks/index'
  end

  get '/landmarks/new' do   #create - shows new page to create landmarks 
      erb :'landmarks/new'
  end

  get '/landmarks/:id' do  #shows = shows landmark by id
      @landmarks = Landmark.find(params[:id])
      erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do  #update - shows edit page to edit landmarks
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
    redirect '/landmarks'
  end
end
