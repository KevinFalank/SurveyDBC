get '/create' do
  erb :create
end

post '/create' do
  survey = Survey.create(users_id: session[:id],
                title: params[:title])
  survey.questions << question = Question.create(text: params[:question])
  values_array = []
  params.each do |key, value|
    if key =~ /var\d+/
      values_array << value
    end

  end

   values_array.each do |answer|
    question.answers << Answer.create(text: answer)
   end
end

# Take each element with name that matches var and
# shovel to an array.
# Iterate through array to add values to db

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :display_survey
end

post '/surveys' do
  params.inspect

  # @answers = params[:answers]
  # @answers.inspect
end
