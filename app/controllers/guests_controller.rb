class GuestsController < ApplicationController 
  before_action :require_login 

  def index 
    @guests = current_user.guests 
  end
end
