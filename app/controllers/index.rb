get '/' do
  @questions = Question.order(:id).all
  erb :index
end
