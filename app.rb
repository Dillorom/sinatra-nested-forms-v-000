require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.all
      erb :'pirate/index'

      # params[:pirate][:ships].each do |ship|
      #   Ship.new(ship)
      # end
      # @ships = Ship.all

      #erb :'pirates/show'
    end
    get "/pirates/:id" do
      @pirate = Pirate.find(params[:id])
      erb :"/pirate/show"
    end

  end
end
