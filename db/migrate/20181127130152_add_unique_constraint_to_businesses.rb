# frozen_string_literal: true

class AddUniqueConstraintToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_index :businesses, :contact_number, unique: true
  end
end
