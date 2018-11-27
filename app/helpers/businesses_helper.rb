# frozen_string_literal: true

module BusinessesHelper
  def business_owner(current_user, business_owner_id)
    current_user == business_owner_id
  end
end
