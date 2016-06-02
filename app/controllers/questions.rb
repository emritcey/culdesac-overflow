get '/questions/:id' do
  @question = Question.find(params[:id])
  new_count = @question.views_count +=1
  @question.update_attribute(:views_count, new_count)
  erb :'/questions/show'
end

post '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = Answer.create(question_id: @question.id, user_id: current_user.id, description: params[:answer_textbox])
  erb :'/questions/show'
end

