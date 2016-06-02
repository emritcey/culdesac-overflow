enable :sessions

get '/session-viewer' do 
  session.inspect
end

get '/users' do
  erb :'users/index'
end

get '/users/new' do 
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])

  if user.save
    redirect '/users/login' # will want to change to automatically sign user in after registration
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do 
  erb :'users/login'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

delete '/users/logout' do 
  session.clear
  erb :'users/logout'
end

