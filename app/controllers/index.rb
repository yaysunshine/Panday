require 'sinatra'
# require 'debugger'

get '/' do
  erb :sign_in
end

get '/reveal' do
  # params[:id]
  @panda = Photo.all.sample
  @panda.url

  # erb :sign_in

  # debugger
  # # redirect to("https://twitter.com/auth/twitter")
  # redirect "https://api.twitter.com/oauth/authorize?oauth_token=#{ENV["CONSUMER_KEY"]}"
end

get '/sign_out' do
end