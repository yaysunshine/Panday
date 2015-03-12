require 'sinatra'

get '/' do
  erb :sign_in
end

get '/sign_in' do
  redirect to("/auth/twitter")
end

get '/sign_out' do
end

get '/auth' do
end