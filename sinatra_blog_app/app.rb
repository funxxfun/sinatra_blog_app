require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require './models.rb'

enable :sessions

set :database, {adapter: 'sqlite3', database: 'myblogdb.sqlite3'}

get '/' do
  @posts = Post.all
  erb :index
end

post '/post' do
  if session[:user_id]
    @post = Post.new(
      title: params[:title],
      body: params[:body],
      user_id: session[:user_id]
    )
    @post.save
    redirect '/'
  else
    erb :login
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  erb :post
end

patch '/post/:id' do
  post = Post.find(params[:id])
  post.update(
    title: params[:title],
    body: params[:body]
  )
  post.save
  redirect "/post/#{post.id}"
end

delete '/post/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect '/'
end


get '/signup' do
  # からの@userを作って@userがNillになるのを防ぐ
  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.new(
    name: params[:name],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    erb :signup
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(
    name: params[:name],
    password: params[:password]
  )
  if @user.nil?
    redirect '/login'
  end
  session[:user_id] = @user.id
  redirect "/"
end

post '/logout' do
  session.clear
  redirect '/'
end


get '/user' do
  @users = User.all
  erb :user
end

get '/user/:id' do
  @user = User.find(params[:id])
  # if @user && @user.authenticate(session[:user_id])
    erb :user_show
  # elseú
    # redirect '/login'
  # end
end

# get '/user_new' do
#   @user = User.new
#   erb :user_new
# end


get '/task' do
  @tasks = Task.all
  erb :task
end

post '/task' do
  @task = Task.new(
    task_name: params[:task_name],
    status: params[:status],
    deadline: params[:deadline]
  )
  @task.save
  redirect '/task'
end

get '/task/:id' do
  @task = Task.find(params[:id])
  erb :task_show
end

patch '/task/:id' do
  task = Task.find(params[:id])
  task.update(
    task_name: params[:task_name],
    status: params[:status],
    deadline: params[:deadline]
  )
  task.save
  redirect '/task'
end

# delete '/task/:id' do
#   task = Task.find(params[:id])
#   task.destroy
#   redirect '/task'
# end


get '/destroy/task/:id' do
  task = Task.find(params[:id])
  task.destroy
  redirect '/task'
end

get '/like' do
  @like = Like.new
  @like.save
  redirect '/'
end

# post '/like' do
#   if like.nil?
#     like = 1
#   else
#     like = like + 1
#   end
#   erb :index
# end

