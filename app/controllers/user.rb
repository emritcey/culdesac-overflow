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
    redirect '/users/login' # will want to automatically sign user in after registration
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/login' do 
  erb :'users/login'
end

get '/users/:user_id' do
  @user = User.find_by(id: params[:user_id])
  erb :'users/show'
end

get '/users/:user_id/answers' do
  @user = User.find_by(id: params[:user_id])
  @answers = @user.answers
  erb :'users/show_answers'
end

get '/users/:user_id/questions' do
  @user = User.find_by(id: params[:user_id])
  @questions = @user.questions
  erb :'users/show_questions'
end

delete '/users/logout' do 
  session.clear
  erb :'users/logout'
end

