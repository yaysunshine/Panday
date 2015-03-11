require 'rubygems'
require 'sinatra'

# helpers do
#   def base_path
#     "#{request.env['rack.url_scheme']}://#{requeest.env['HTTP_HOST']}"
#   end

#   def signed_in?
#     if session[:oauth_verifier].nil?
#       return false
#     else
#       return true
#     end
#   end
# end

get '/' do
  erb :sign_in
end

get '/:user_id/profile' do
  erb :profile
end

# get '/sign_in' do
#   @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
#   session[:request_token] = @request_token
#   redirect @request_token.authorize_url(:oauth_callback => @callback_url)
#   # redirect request_token.authorize_url
# end

# get '/auth' do

  # @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # session.delete(:request_token)
  # erb :profile
# end

get '/auth' do
  oauth = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET,
   { :site => "http://twitter.com" })

  url = "https://panday.herokuapp.com/auth/callback"
  request_token = oauth.get_request_token(:oauth_callback => url)

  session[:token] = request_token.token
  session[:secret] = request_token.secret

  redirect_to request_token.authorize_url
  # request_token = oauth_client.request_token(:oauth_callback => 'https://panday.herokuapp.com/auth/callback')
  # session[:request_token] = request_token.token
  # session[:request_token_secret] = request_token.secret
  # redirect request_token.authorize_url
end

get '/auth/callback' do
  request_token = OAuth::RequestToken.new(oauth, session[:request_token],
    session[:request_token_secret]
    )
  access_token = request_token.get_access_token(
    :oauth_verifier => params[:oauth_verifier]
    )

  oauth = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET,
    { :site => "http://twitter.com" }
    )

  response = oauth.request(:get, '/account/verify_credentials.json',
    access_token, { :scheme => :query_string })

  user_info = JSON.parse(response.body)

  User.find_by(username: info['username']).name
  # redirect '/:user_id/profile'
  # access_token = oauth_client.authorize(session[:request_token], session[:request_token_secret], :oauth_verifier => params[:oauth_verifier])
  # session[:access_token] = access_token.token
  # session[:secret_token] = access_token.secret
  # @client = client(session[:access_token], session[:secret_token])
  # info = @client.verify_credentials
  # User.create(name: info['name'], username: info['username'], phone_number: info['phone_number'])
  # session[:username] = User.find_by(username: info['username']).name
  # redirect '/:user_id/profile'
end

get '/sign_out' do
  session.clear
  redirect '/'
end


