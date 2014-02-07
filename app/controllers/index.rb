get '/' do
  session[:id] = 1
  # Look in app/views/index.erb
  erb :index
end
