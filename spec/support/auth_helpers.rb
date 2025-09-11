module AuthHelpers 
  def log_in(user) 
    post sessions_path, params: { username: user.username, password: user.password }
  end
end
