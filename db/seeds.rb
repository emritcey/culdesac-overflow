require 'faker'

10.times { 
  User.create!(username: Faker::Internet.user_name, password: "password")
}

10.times {
  Question.create!(:title => Faker::Lorem.sentence.slice(0..-2) + "?", :description => Faker::Lorem.paragraphs(rand(2..5)).join('\n'), user_id: rand(1..10))
}


30.times {
  Answer.create!(:description => Faker::Lorem.paragraphs(rand(2..5)).join('\n'), user_id: rand(1..10), question_id: rand(1..10))
}
