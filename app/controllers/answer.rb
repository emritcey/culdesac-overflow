get '/answers/users/:user_id' do
  @user = User.find_by(id: params[:user_id])
  @answers = @user.answers
  erb :'answers/by_user'
end