get '/votes/users/:user_id' do 
  @user = User.find_by(id: params[:user_id])
  @votes = @user.votes
  erb :'votes/show'
end
