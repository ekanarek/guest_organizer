class TablesController < ApplicationController
  before_action :require_login

  def index
    @tables = current_user.tables
  end

  def new
    @table = @table.new(user: current_user)
  end

  def create
    @table = current_user.tables.build(table_params)

    if @table.save
      redirect_to tables_path, notice: "Table added!"
    else
      flash.now[:alert] = "Error creating table"
      render :new, status: :unprocessable_entity
    end
  end

private

  def table_params
    params.require(:table).permit(:name, :seat_capacity)
  end
end
