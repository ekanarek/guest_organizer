class GuestsController < ApplicationController 
  before_action :require_login 
  before_action :set_dietary_restrictions, only: [:new, :create, :edit, :update] 
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index 
    @unassigned_guests = current_user.guests.unassigned
    @all_guests = current_user.guests 
  end

  def new 
    @guest = Guest.new(user: current_user)
  end

  def create 
    @guest = current_user.guests.build(guest_params)

    if @guest.save 
      if @guest.table.present? 
        @guest.table.increment!(:seats_taken) 
      end

      redirect_to root_path, notice: "Guest added!" 
    else 
      flash.now[:alert] = "Error creating guest" 
      render :new, status: :unprocessable_entity 
    end
  end

  def update 
    handle_custom_restriction(@guest) 

    if @guest.update(guest_params) 
      redirect_to guest_path(@guest), notice: "Guest updated!" 
    else 
      flash.now[:alert] = "Error updating guest" 
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy 
    if @guest.table.present? 
      @guest.table.decrement!(:seats_taken) 
    end 

    @guest.destroy 
    redirect_to root_path, notice: "Guest deleted!" 
  end

  private 

  def guest_params 
    params.require(:guest).permit(:name, :age, :table_id, dietary_restriction_ids: []) 
  end

  def set_dietary_restrictions 
    @dietary_restrictions = DietaryRestriction.where(user_id: [nil, current_user.id]) 
  end

  def set_guest 
    @guest = current_user.guests.find(params[:id]) 
  end 

  def handle_custom_restriction(guest)
    if params[:new_dietary_restriction_name].present? 
      custom_restriction = current_user.dietary_restrictions.create(
        name: params[:new_dietary_restriction_name],
        description: params[:new_dietary_restriction_description]
      )
      guest.dietary_restrictions << custom_restriction if custom_restriction.persisted? 
    end
  end
end
