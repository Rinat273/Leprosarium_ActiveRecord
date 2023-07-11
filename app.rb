require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "leprosorium.db"}

class Post < ActiveRecord::Base
	validates :content, presence: true
	has_many :comments
end

class Comment < ActiveRecord::Base

end

class Author < ActiveRecord::Base
	has_many :comments
end

before do
	@results = Post.all
end

get '/' do

	@results = Post.order('created_at DESC')

	erb :index		
end

get '/new' do
	@c = Post.new
   erb :new
end

post '/new' do
  @c = Post.new params[:post]
  	if @c.save
		erb "<h2>Пост добавлен</h2>"
	else
		@error = @c.errors.full_messages.first
   		erb :new
	end

	redirect to '/'
 end