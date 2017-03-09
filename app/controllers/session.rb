
get '/session/new' do
  erb :'/session/new'
end

post '/session' do
  user = User.find_by(email: params[:user][:email])
  # binding.pry
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/libraries'
  else
    @errors = ['Email/password is invalid']
    erb :'/session/new'
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect '/session/new'
end
