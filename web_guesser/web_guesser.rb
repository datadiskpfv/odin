require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(101)

## below gets refreshed when you reload the page
get '/' do
  #erb :index, :locals => {:number => number}

  if params["guess"].to_i > NUMBER
    message = "You're guess is to high"
  elsif params["guess"].to_i < NUMBER
    message = "You're guess is to low"
  else
    message = "WINNER Well done you have guessed correctly!!!!!"
  end
  erb :index, :locals => {:number => NUMBER, :message => message}
  #throw params.inspect
end