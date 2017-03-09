def curret_user
  @curret_user ||= User.find_by(id: session[:user_id])
end

def logedin?
  !!curret_user
  # curret_user ? true : false

end

def require_user
  redirect '/session/new' unless logedin?
end
# if @curret_user
#   return curret_user
# else
#   @curret_user = User.find_by(id: session[:user_id])
# end
