get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:username])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = "Invalid username or password"
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.delete(:user_id)
  redirect '/'
end
