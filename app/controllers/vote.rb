post '/questions/:id/vote' do
  @question = Question.find(params[:id])
  Vote.create(value: params[:value], user_id: current_user.id, votable_id: @question.id, votable_type: "Question")
  if request.xhr?
    content_type :json
    {points: @question.points}.to_json
  else
    redirect '/questions'
  end
end

