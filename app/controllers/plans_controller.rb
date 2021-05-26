class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.create(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end

  end

  private

  def plan_params
    params.require(:plan).permit(:site_name, :place, :period, :start_time, :number_of_people, :belongings, :phone_number, :car, :prefecture_id).merge(user_id: current_user.id)
  end

end
