
#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

get '/users/:user_id/account' do
  @href_root = "surveys"
  @surveys = Survey.where('users_id = ?', params[:user_id])
  erb :dashboard
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @username = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  p params
  @username = params[:username]
  user = User.authenticate(@username, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    return session[:user_id] = user.id.to_s
    # redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end



