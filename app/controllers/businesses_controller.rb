# frozen_string_literal: true

# Business controller
class BusinessesController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def show
    business = Business.find(params[:id])
    flash[:error] = 'Business not found' unless business
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

  def business_params
    params.require(:business).permit(:business_name, :business_email,
                                     :business_location, :contact_number,
                                     :business_description, :category_id)
  end
end


