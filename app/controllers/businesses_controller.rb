# frozen_string_literal: true

# Business controller
class BusinessesController < ApplicationController

  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end
end


