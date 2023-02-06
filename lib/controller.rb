require 'gossip'
# require 'pry'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all} # locals permet de créer une variable "gossips = Gossip.all" et de l'emmener vers le view
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    Gossip.find(params['id'])
    erb :show, locals: {specific: params['id'], index: Gossip.find(params['id'])}
  end

  post '/gossips/:id/edit/' do
    gossip = Gossip.find(params['id'])
    gossip.update(params["gossip_author"], params["gossip_content"])
    redirect '/'
  end

  get '/gossips/:id/edit/' do
    Gossip.find(params['id'])
    erb :edit
  end
  

  
end

# binding.pry