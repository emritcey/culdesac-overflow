enable :sessions

get '/session-viewer' do
  session.inspect
end

#page for list of all users
get '/users' do
  @users = User.order(:id).all
  erb :'users/show-all'
end

#registration page
get '/users/new' do
  erb :'users/new'
end

#registration working
post '/users' do
  user = User.new(params[:user])

  if user.save
    redirect '/users/login' # will want to change to automatically sign user in after registration
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

#login page
get '/users/login' do
  erb :'users/login'
end
#autheticate login
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end
#logout
delete '/users/logout' do
  session.clear
  erb :'/index'
end

get '/users/:user_id/answers' do
  @user = User.find_by(id: params[:user_id])
  @answers = @user.answers
  if request.xhr?
    @answers.to_json
  else
    erb :'answers/by_user'
  end
end

get '/users/:user_id/questions' do
  @user = User.find_by(id: params[:user_id])
  @questions = @user.questions
  if request.xhr?
    @questions.to_json
  else
    erb :'questions/by_user'
  end
end

get '/users/:user_id/votes' do
  @user = User.find_by(id: params[:user_id])
  @votes = @user.votes
  if request.xhr?
    @votes.to_json
  else
    erb :'votes/show'
  end
end
