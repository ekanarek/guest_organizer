class GuestsController < ApplicationController 
  before_action :require_login 

  def index 
    @guests = current_user.guests 
  end

  def new 
    @guest = Guest.new(user: current_user)
  end

  def create 
  end
end
