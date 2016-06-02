get '/tags' do
  @tags = Tag.all
  @taggings = Tagging.all
  erb :'/tags/index'
end
