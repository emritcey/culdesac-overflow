post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.create(question_id: @question.id, user_id: current_user.id, description: params[:answer_textbox])
  erb :'/questions/show'
end
