class ShirtsController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end

  shirts = [{
      id: 0,
      title: "shirt 1",
      body: "This is the first shirt"
  },
  {
      id: 1,
      title: "shirt 2",
      body: "This is the second shirt"
  },
  {
      id: 2,
      title: "shirt 3",
      body: "This is the third shirt"
  }];

  get '/' do


      @shirts = Shirt.all

      erb :'shirts/index'

  end

  get '/:id' do

    # get the ID and turn it in to an integer
    id = params[:id].to_i
    # make a single shirt object available in the template
    @shirts = Shirt.find id

    erb :'./shirts/show'

  end

  post '/' do
    new_shirt = {
      id: params[:id],
      title: params[:title],
      body: params[:body]
    }
    shirts.push new_shirt
    @shirts = shirts

    redirect '/'

  end


  get '/shirts/new'  do

    @shirts = {
      id: "",
      title: "",
      body: ""
    }
    erb :'/shirts/new'

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
    shirts.delete_at(id)

    redirect '/'
  end

  get '/:id/edit'  do
    id = params[:id].to_i
    @shirts = Shirt.find id
    erb :'/shirts/edit'

  end


end
