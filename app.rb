require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require './lib/database_connection_setup'
require 'uri'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash
  
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
    if Bookmark.create(url: params[:url], title: params[:title])
      redirect '/bookmarks'
    else 
      flash[:notice] = "Incorrect URL." 
      redirect '/bookmarks/add'
    end
  end

  delete '/bookmarks/:title' do
    Bookmark.delete(title: params[:title])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark_id = params[:id]
     @bookmark = Bookmark.find(id: params[:id])
    erb :edit
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
   
    redirect('/bookmarks')
  end

  run! if app_file == $0

end
