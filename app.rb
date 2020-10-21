require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  enable :sessions
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/addbookmark' do
    erb(:'bookmarks/addbookmark')
  end

  post '/addingbookmark' do
    Bookmark.new_bookmark(params[:Add_Bookmark])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
