require 'faker'


1.upto(5) do |n|
  Survey.create(users_id: 1, title: Faker::Lorem.word)
end

Survey.all.each do |sur|
  1.upto(5) do |n|
    sur.questions << Question.create(text: Faker::Lorem.sentence)
  end
end

Question.all.each do |q|
  1.upto(5) do |n|
    q.answers << Answer.create(text: Faker::Lorem.sentence)
  end
end


