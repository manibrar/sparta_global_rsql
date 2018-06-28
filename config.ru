require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?
require_relative './controllers/shirts_controller.rb'
require_relative './models/shirts.rb'


run ShirtsController
