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

# Take each element with name that matches var and
# shovel to an array.
# Iterate through array to add values to db

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :display_survey
end

post '/surveys' do
  # {"answers"=>{"1"=>"2", "2"=>"8", "3"=>"11", "4"=>"16", "5"=>"25"}, "survey_id"=>"1"}
  # params.inspect
  @answers = params[:answers]
  @survey_id = params[:survey_id]
  participant = Participant.create(survey_id: @survey_id, user_id: session[:user_id])
  @answers.each do |q, a|
    Result.create(participant_id: participant.id, answer_id: a)
  end
end

get '/finish' do
  session[:survey_id] = nil
  redirect '/'
end
