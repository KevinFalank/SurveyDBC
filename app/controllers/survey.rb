get '/create' do
  erb :create
end

post '/create' do
  if session[:survey_id] == nil && params[:title] == ""
    "Survey needs a title"
  else
    session[:survey_id] = Survey.create(users_id: session[:id],
                  title: params[:title]).id if params[:title] != nil
    Survey.find(session[:survey_id]).questions << question = Question.create(text: params[:question]) if params[:question] != ""

     generate_answers(params).each do |answer|
      question.answers << Answer.create(text: answer) if answer != ""
     end
   end

   redirect '/create'
end
