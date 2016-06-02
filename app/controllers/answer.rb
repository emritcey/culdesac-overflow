post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(description: params[:description])
  @answer.question_id = @question.id
  @answer.user_id = current_user.id
  @answer.save
  # if request.xhr?
  #   content_type :json
  #   {description: @answer.description, username: current_user.username}.to_json
  # else
    redirect "/questions/#{@question.id}"
  # end
end


post '/questions/:id/answers/:answer_id/favorite' do
  question = Question.find(params[:id])
  question.update_attribute(:favorite_answer_id, params[:answer_id])
  if request.xhr?
    200
  else
    redirect '/question/'
  end
end

