class SetList < Sinatra::Base

  get '/' do
    erb :welcome
  end

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  post '/songs' do
    song = Song.create(params[:song])
    redirect '/songs'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :"/songs/show"
  end

  helpers do
    def number_to_currency(number)
      ('$%.2f' % number).to_s
    end
  end

end
