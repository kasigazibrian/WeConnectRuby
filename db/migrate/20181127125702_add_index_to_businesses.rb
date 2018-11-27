# frozen_string_literal: true

class AddIndexToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_index :businesses, :business_email, unique: true
  end
end
