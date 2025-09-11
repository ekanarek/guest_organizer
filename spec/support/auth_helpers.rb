module AuthHelpers 
  def log_in(user) 
    post "/login", params: { username: user.username, password: user.password }
  end
end
