require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  get '/bookmarks/add' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    erb :bookmarks
  end

  delete '/bookmarks/:title' do
    Bookmark.delete(title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
