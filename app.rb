require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    url = params[:url]
    Bookmark.create(url)
    erb :bookmarks
  end

  run! if app_file == $0

end
