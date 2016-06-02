post '/questions/:id/vote' do
  @question = Question.find(params[:id])
  if params.has_key?('up')
    @question.votes.create(value: 1)
  else
    @question.votes.create(value: -1)
  end

  if request.xhr?
    @question.points.to_s
  else
    redirect '/questions'
  end
end

