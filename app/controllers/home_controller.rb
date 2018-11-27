# frozen_string_literal: true

# user controller class
class HomeController < ApplicationController
  def index
    @user = User.first
  end
end
