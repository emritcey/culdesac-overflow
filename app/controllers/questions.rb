get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = Answer.create(question_id: @question.id, user_id: current_user.id, description: params[:answer_textbox])
  erb :'/questions/show'
end

get '/questions/users/:user_id' do
  @user = User.find_by(id: params[:user_id])
  @questions = @user.questions
  erb :'questions/by_user'
end
