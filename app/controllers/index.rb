require 'sinatra'
# require 'twilio-ruby'
# require 'debugger'


get '/' do
  erb :sign_in
end

get '/reveal' do
  @panda = Photo.all.sample

  @client = Twilio::REST::Client.new ENV["account_sid"], ENV["auth_token"]

  @client.messages.create(
    :from => "+14159067463",
    :to => "+14159479096",
    :body => "testing",
    :media_url => "http://s3-ec.buzzfed.com/static/imagebuzz/web02/2010/2/13/12/its-cool-im-just-a-panda-4607-1266081857-9.jpg",
    )

  @panda.url
end

get '/sign_out' do
end

