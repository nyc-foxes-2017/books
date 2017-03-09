def curret_user
  @curret_user ||= User.find_by(id: session[:user_id])
end

# if @curret_user
#   return curret_user
# else
#   @curret_user = User.find_by(id: session[:user_id])
# end
