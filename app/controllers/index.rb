get '/' do
  erb :sign_in
end

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/auth' do
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  session.delete(:request_token)
   user = User.where(oauth_token: params[:oauth_token], oauth_secret: params[:oauth_secret])
   session[:user_id] =user.id

  erb :profile

end