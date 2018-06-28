class ShirtsController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views")}
  configure :development do
    register Sinatra::Reloader
  end

shirts = [
  {
  id:0,
  title: "Extra small shirt",
  size: "XS",
  colour: "Orange",
  material:"Plaid"
},
{
  id:1,
  title: "Small shirt",
  size: "S",
  colour: "lightblue",
  material:"Denim"
},
{
  id:2,
  title: "Medium shirt",
  size: "M",
  colour: "pink",
  material:"Silk"
},
{
  id:3,
  title: "Large shirt",
  size: "L",
  colour: "lightgrey",
  material:"Nylon"
},
{
  id:4,
  title: "Extra Large shirt",
  size: "XL",
  colour: "purple",
  material:"Elastic"
}
]



get '/' do
  @title = "Blog posts"
  @shirts = Shirt.all
  redirect '/index'
end

get '/new' do
end

post '/' do
end

get '/:id' do
  

end

get '/:id/edit' do
end

put '/photos/:id' do
end

delete '/:id' do
end

end
