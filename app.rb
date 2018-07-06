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

      # params[:pirate][:ships].each do |ship|
      #   Ship.new(ship)
      # end
      # @ships = Ship.all

      #erb :'pirates/show'

    get "/pirates/:id" do
      @pirate = Pirate.find(params[:id])
      erb :"/pirate/show"
    end

    post '/pirates' do
      pirate = Pirate.create(name: params[:pirate][:name], weight: params[:pirate][:weight], height: params[:pirate][height])
      params[:pirate][:ships].each do |ship_data|
        ship = Ship.new(ship_data)
        ship.pirate = pirate
        ship.save
      end
      redirect to "/pirates/#{pirate.id}"
    end

  end
end
