get '/' do
  @questions = Question.order(views_count: :desc).all
  erb :index
end
