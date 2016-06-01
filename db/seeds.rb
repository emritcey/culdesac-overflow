require 'faker'

poly_types = ["question", "answer"]

tags = ["driveway care", "lawn maintenance", "mailbox design", "shrubbery", "dead ends", "street shape", "safety", "loopty-loo", "pockets", "circular", "soccer practice", "spotting hoodlums", "community", "front-door color", "neighbors", "welcome wagons", "curfew", "suburban life", "soccer moms", "street hockey", "kids", "vans"]


10.times { 
  User.create!(username: Faker::Internet.user_name, password: "password")
}

30.times {
  Question.create!(:title => Faker::Lorem.sentence.slice(0..-2) + "?", :description => Faker::Lorem.paragraphs(rand(2...5)).join('\n'), user_id: rand(1...10), views_count: rand(1...200))
}

30.times {
  Answer.create!(:description => Faker::Lorem.paragraphs(rand(2...5)).join('\n'), user_id: rand(1...10), question_id: rand(1...30))
}

50.times {
  Comment.create!(:description => Faker::Lorem.paragraphs(rand(2...5)).join('\n'), user_id: rand(1...10), commentable_id: rand(1...30), commentable_type: poly_types.sample)
}

tags.each do |tag|
  Tag.create!(description: tag)
end

20.times {
  Tagging.create!(tag_id: rand(1...20), question_id: rand(1...30))
}

100.times {
  Vote.create!(user_id: rand(1...10), votable_id: rand(1...30), votable_type: poly_types.sample)
}