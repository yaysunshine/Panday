require 'rubygems'
require 'sinatra'

get '/' do
  "pandas!"
  erb :signed_in
end
