require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'PG'
require_relative './controllers/shirts_controller.rb'
require_relative './models/shirts.rb'

use Rack::Reloader
use Rack::MethodOverride

run ShirtsController
