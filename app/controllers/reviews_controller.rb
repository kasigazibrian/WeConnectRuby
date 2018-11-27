# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    business = Business.find_by(id: params[:business_id])
    review = Review.new(review_params)
    review[:business_id] = params[:business_id]
    if review.save
      flash[:notice] = 'Review added successfully'
      redirect_to business_path(business.id)
    else
      flash[:error] = review.errors.full_messages.first
      redirect_to business
    end
  end

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
