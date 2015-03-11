require 'rubygems'
require 'sinatra'

helpers do
  def base_path
    "#{request.env['rack.url_scheme']}://#{requeest.env['HTTP_HOST']}"
  end

  def signed_in?
    if session[:oauth_verifier].nil?
      return false
    else
      return true
    end
  end
end

get '/' do
  erb :sign_in
end

get '/:user_id/profile' do
  erb :profile
end

get '/auth' do
  client = TwitterOAuth::Client.new(
    :consumer_key => ENV['CONSUMER_KEY'],
    :consumer_secret => ENV['CONSUMER_SECRET'],
    )

  request_token = client.request_token(
    :oauth_callback => base_path + '/sign_in',
    )
  session[:request_token] = request_token

  redirect (request_token.authorize_url)
end

#   @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
#   session.delete(:request_token)
#   erb :profile
# end

get '/sign_in' do
  client = TwitterOAuth::Client.new(
    :consumer_key => ENV['CONSUMER_KEY'],
    :consumer_secret => ENV['CONSUMER_SECRET'],
    )
  access_token = client.authorize(
    session[:request_token].token,
    session[:request_token].secret,
    :oauth_verifier => params[:oauth_verifier]
    )
  session[:oauth_verifier] = params[:oauth_verifier]
  redirect '/'
end
#   redirect request_token.authorize_url
# end

get '/tweet' do
  client = TwitterOAuth::Client.new(
    :consumer_key => ENV['CONSUMER_KEY'],
    :consumer_secret => ENV['CONSUMER_SECRET'],
    )
  access_token = client.authorize(
    session[:request_token].token,
    session[:request_token].secret,
    :oauth_verifier => params[:oauth_verifier]
    )
  tweet = "#{params['panda']}"
  client.update(tweet)
end

get '/sign_out' do
  session[:request_token] = nil
  session[:oauth_verifier] = nil
  redirect '/'
end
#   session.clear
#   redirect '/'
# end
