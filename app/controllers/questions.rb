get '/questions/:id' do
  @question = Question.find(params[:id])
  new_count = @question.views_count +=1
  @question.update_attribute(:views_count, new_count)
  erb :'/questions/show'
end

post '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = Question.create(question_id: @question.id, user_id: current_user.id, description: params[:answer_textbox])
  erb :'/questions/show'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions/:id/comment' do
  @comment = Comment.create(user_id: current_user.id, description: params[:comment_textbox], commentable_type: "Question", commentable_id: params[:id])
  if request.xhr?
    content_type :json
    {username: @comment.commenter.username, user_id: @comment.user_id, description: @comment.description, created_at: @comment.created_at}.to_json
  else
    erb :show  
  end
end
