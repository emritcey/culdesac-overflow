get '/questions/new' do
  erb :'/questions/question_form'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  new_count = @question.views_count +=1
  @question.update_attribute(:views_count, new_count)
  erb :'/questions/show'
end

post '/questions/new' do
  @question = Question.new(params[:question])
  @question.user_id = current_user.id
  @question.views_count = 0
  @question.save
  tags_titles = params[:tags].split(",")
  redirect "/questions/#{@question.id}"
end

post '/questions/:id/comment' do
  @question = Question.find(params[:id])
  @comment = Comment.create(user_id: current_user.id, description: params[:comment_textbox], commentable_type: "Question", commentable_id: params[:id])
  if request.xhr?
    content_type :json
    {username: @comment.commenter.username, user_id: @comment.user_id, description: @comment.description, created_at: @comment.created_at}.to_json
  else
    erb :'/questions/show'
  end
end
