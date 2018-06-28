require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?
require_relative './controllers/shirts_controller.rb'
require_relative './models/shirts.rb'

use Rack::Reloader
use Rack::MethodOverride

run ShirtsController
