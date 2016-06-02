post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(description: params[:description])
  @answer.question_id = @question.id
  @answer.user_id = current_user.id
  @answer.save

  redirect "/questions/#{@question.id}"
end
