post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.create(question_id: @question.id, user_id: current_user.id, description: params[:answer_textbox])
  erb :'/questions/show'
end


post '/questions/:id/answers/:answer_id/favorite' do
  question = Question.find(params[:id])
  question.update_attr(:favorite_answer_id, params[:answer_id])
  if request.xhr?
    200
  else
    redirect '/question/'
  end
end

