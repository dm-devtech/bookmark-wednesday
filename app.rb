require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  enable :sessions
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/addbookmarks' do
    erb(:addbookmark)
  end

  post '/addingbookmark' do
    @addbookmark = Bookmark.add_bookmark([params: new_bookmark])
    erb : 'bookmarks/index'
  end

  run! if app_file == $0
end
