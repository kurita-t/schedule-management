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

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    if current_user.id == @plan.user_id
      @plan.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  private

  def plan_params
    params.require(:plan).permit(:site_name, :place, :period, :start_time, :number_of_people, :belongings, :phone_number, :car, :prefecture_id).merge(user_id: current_user.id)
  end

end
