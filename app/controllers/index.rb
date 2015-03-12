require 'sinatra'
require 'omniauth-twitter'



get '/' do
  erb :sign_in
end

get '/sign_in' do
end

get '/sign_out' do
end

get '/auth' do
end