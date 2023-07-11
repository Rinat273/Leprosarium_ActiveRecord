require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Post < ActiveRecord::Base
	has_many :comments
end

class Comment < ActiveRecord::Base

end

class Author < ActiveRecord::Base
	has_many :comments
end

get '/' do
	erb :index		
end

get '/new' do
  "Hello World"
end