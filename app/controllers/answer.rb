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

post '/questions/:id/answers/:answer_id/comment' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.create(user_id: current_user.id, description: params[:comment_text], commentable_type: "Answer", commentable_id: params[:answer_id])
  if request.xhr?
    p "XHR"
    content_type :json
    {username: @comment.commenter.username, user_id: @comment.user_id, description: @comment.description, created_at: @comment.created_at.strftime("%b %d"), time: @comment.created_at.strftime("%l:%M")}.to_json
  else
    p 'DEFIONITELY NOT '
    erb :'/questions/show'
  end
end


