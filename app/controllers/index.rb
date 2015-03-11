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
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  session.delete(:request_token)
  erb :profile
end

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end
