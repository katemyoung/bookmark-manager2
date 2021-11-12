require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmark' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index' 
  end
  
  get '/addbookmark' do 
    erb :'bookmarks/addbookmark'
    
  end
  
  post '/addbookmark' do
    Bookmark.create(url: params[:url])
    redirect '/bookmark'
  end

  run! if app_file == $0
end
