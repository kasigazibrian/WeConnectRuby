# frozen_string_literal: true

# user controller class
class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[get_user_profile upload_photo]
  def index
    @user = User.first
  end

  def get_user_profile
    @businesses = Business.where(user_id: params[:user_id])
    render 'users/sessions/user_profile'
  end

  def upload_photo
    user = User.find_by(id: permitted_params[:user_id])
    if user.avatar.attach(permitted_params[:avatar])
      flash[:notice] = 'Profile image updated successfully'
      redirect_to "/users/#{permitted_params[:user_id]}/profile"
    else
      flash[:error] = 'Profile image upload failed'
    end
  end

  def permitted_params
    params.permit(:avatar, :user_id)
  end
end
