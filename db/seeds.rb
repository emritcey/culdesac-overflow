require 'faker'

10.times { 
  User.create!(username: Faker::Internet.user_name, password: "password")
}

30.times {
  Question.create!(:title => Faker::Lorem.sentence.slice(0..-2) + "?", :description => Faker::Lorem.paragraphs(rand(2...5)).join('\n'), user_id: rand(1...10), views_count: rand(1...200))
}


30.times {
  Answer.create!(:description => Faker::Lorem.paragraphs(rand(2...5)).join('\n'), user_id: rand(1...10), question_id: rand(1...10))
}

commentable_types = ["question", "answer"]
50.times {
  Comment.create!(:description => Faker::Lorem.paragraphs(rand(2...5)).join('\n'), user_id: rand(1...10), commentable_id: rand(1...30), commentable_type: commentable_types.sample)
}

num_words = rand(1...3)
20.times {
  Tag.create!(:description => Faker::Lorem.words(num_words))
}

20.times {
  Tagging.create!(tag_id: rand(1...20), question_id: rand(1...30))
}