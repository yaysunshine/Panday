require 'sinatra'


get '/' do
  erb :sign_in
end

get '/reveal' do
  @panda = Photo.all.sample
  @panda.url
end

get '/send' do
  @client = Twilio::REST::Client.new ENV["account_sid"], ENV["auth_token"]

  @client.messages.create(
    :from => "+14159067463",
    :to => "+14159479096",
    :media_url => "#{params[:picUrl]}",
    )
end

get '/sign_out' do
end

