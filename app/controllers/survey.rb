get '/create' do
  erb :create
end

post '/create' do
  session[:survey_id] = Survey.create(users_id: session[:user_id],
                title: params[:title]).id if params[:title] != nil
  Survey.find(session[:survey_id]).questions << question = Question.create(text: params[:question]) if params[:question] != ""

   generate_answers(params).each do |answer|
    question.answers << Answer.create(text: answer) if answer != ""
   end

    redirect '/create'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @user_id = current_user ? current_user.id : nil
  erb :display_survey
end

post '/surveys' do
  @answers = params[:answers]
  @survey_id = params[:survey_id]
  participant = Participant.create(survey_id: @survey_id, user_id: session[:user_id])
  @answers.each do |q, a|
    Result.create(participant_id: participant.id, answer_id: a)
  end

  redirect '/'
end

get '/finish' do
  session[:survey_id] = nil
  redirect '/'
end

get '/surveys/:survey_id/survey_stats' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_stats
end

post '/question' do

end
