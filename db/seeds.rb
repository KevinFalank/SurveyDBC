require 'faker'

jacky = User.create(username: 'jacky')
jacky.password = 'password'
jacky.save

#Jacky cretes a survey

survey = Survey.create(title: 'Animal Sounds', users_id: 1)
survey.questions << question1 = Question.create(text: 'What does the Fox say?')
survey.questions << question2 = Question.create(text: 'What does the Squerrel say?')
survey.save
question1.answers << Answer.create(text: 'Wa-pa-pa-pa-pa-pa-pa-pow!')
question1.answers << Answer.create(text: 'Gering-ding-ding-ding-dingeringeding!')
question1.answers << Answer.create(text: 'Hatee-hatee-hatee-ho!')
question1.save
question2.answers << Answer.create(text: 'Jacha-chacha-chacha-chow!')
question2.answers << Answer.create(text: 'Fraka-kaka-kaka-kaka-kow!')
question2.answers << Answer.create(text: 'A-hee-ahee ha-hee!')
question2.answers

#Jacky takes his own survey
#

Participant.create(survey_id: 1, user_id: 1)

# More stuff 

participants = []
1.upto(100) do |n|
  participants << User.create(username: Faker::Name.first_name)
end

participants.each do |participant|
  Participant.create(survey_id: 1, user_id: participant.id)
end

2.upto(101) do |n|
  Result.create(participant_id: n, answer_id: [1,2,3].sample)
  Result.create(participant_id: n, answer_id: [4,5,6].sample)
end


# 1.upto(5) do |n|
#   Survey.create(users_id: 1, title: Faker::Lorem.word)
# end

# 2.upto(6) do |n|
#   Survey.find(n) do |sur|
#     1.upto(5) do |n|
#       sur.questions << Question.create(text: Faker::Lorem.sentence)
#     end
#   end
# end

# Question.all.each do |q|
#   1.upto(5) do |n|
#     q.answers << Answer.create(text: Faker::Lorem.sentence)
#   end
# end




