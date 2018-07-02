class ShirtsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end


  get '/' do
    @shirts = Shirt.all
    erb :'shirts/index'
  end

  get '/shirts/new'  do

    new_shirt = Shirt.new
    new_shirt.id = ""
    new_shirt.title = ""
    new_shirt.body = ""
    @shirts = new_shirt
    erb :'/shirts/new'

  end

  post '/' do
    new_shirt = Shirt.new
    new_shirt.title = params[:title],
    new_shirt.body = params[:body]
    new_shirt.save
    redirect '/'
  end

  get '/:id' do
    # get the ID and turn it in to an integer
    id = params[:id].to_i
    # make a single shirt object available in the template
    @shirts = Shirt.find id
    erb :'./shirts/show'
  end

  get '/:id/edit'  do
    id = params[:id].to_i
    @shirts = Shirt.find id
    erb :'/shirts/edit'

  end

  put '/:id'  do
    id = params[:id].to_i
    old_shirt = Shirt.find id
    old_shirt.title = params[:title]
    old_shirt.body = params[:body]
    old_shirt.save
    redirect '/'
  end

  delete '/:id'  do
    id = params[:id].to_i

    @shirts = Shirt.destroy id

    redirect "/"
  end




end
