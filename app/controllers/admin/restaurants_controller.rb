class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin  

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was successfully created!" 
      redirect_to admin_restaurants_url
    else
       render :action => :new
       flash[:alert] = "Restaurant was failed to create!"
    end
  end

  private

  def set_restaurant
    @restaurants = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :tel, :opening_hours, :description)   
  end
end
