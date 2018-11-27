# frozen_string_literal: true

# Business controller
class BusinessesController < ApplicationController
  include BusinessesControllerConcern
  before_action :authenticate_user!, only: %i[create new destroy show]
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def edit
    id = params[:id]
    @business = get_business(id)
    render 'businesses/edit'
  end

  def update
    id = params[:id]
    @business = get_business(id)
    if @business.update(business_params)
      flash[:notice] = 'Business updated successfully'
    else
      flash[:error] = 'Update failed please try again'
    end
  end

  def search
    @locations = Business.all.map(&:business_location)
    render 'businesses/search'
  end

  def search_results
    business_name = params[:q]
    category = params[:category].present? ? params[:category] : nil
    location = params[:location].present? ? params[:location] : nil
    results = search_for_business(business_name, location, category)
    render json: results
  end

  def show
    @business = get_business(params[:id])
    @reviews = @business.reviews
    flash[:error] = 'Business not found' unless @business
    redirect_to businesses_path unless @business
  end

  def create
    business = Business.new(business_params)
    business[:user_id] = current_user.id
    if business.save
      flash[:notice] = 'Business registered successfully'
      redirect_to businesses_path
    else
      flash[:error] = business.errors.full_messages.first
      redirect_to new_business_path
    end
  end

  def destroy
    business = Business.find_by(id: params[:id])
    if business.destroy
      flash[:notice] = 'Business deleted successfully'
      redirect_to businesses_path
    else
      flash[:error] = 'Business  not found'
    end
  end

  def business_params
    params.require(:business).permit(:business_name, :business_email,
                                     :business_location, :contact_number,
                                     :business_description, :category_id)
  end

  def get_business(id)
    Business.find_by(id: id)
  end
end
