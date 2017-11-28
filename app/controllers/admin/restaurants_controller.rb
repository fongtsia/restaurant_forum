class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin  
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_restaurants_url
      flash[:notice] = "Restaurant was successfully created!" 
    else
       render :action => :new
       flash[:alert] = "Restaurant was failed to create!"
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant)
      flash[:notice] = "Restaurant was successfully updateed!"
    else
      render :action => :edit
      flash[:alert] = "Restaurant was failed to update!"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_url
    flash[:alert] = "Restaurant was successfully deleted!"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :tel, :opening_hours, :description, :image)   
  end
end
