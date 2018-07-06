require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end
    # code other routes/actions here
    get '/new' do
      erb :new
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ship].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all
      erb :show
    end

  end
end
