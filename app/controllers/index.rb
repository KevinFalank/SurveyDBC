get '/' do
  # session[:id] = 1
  # Look in app/views/index.erb
  @surveys = Survey.all
  erb :index
end
