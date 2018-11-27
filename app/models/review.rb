# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :business
  validates :title, presence: { message: 'is a required field' }, length:
      { minimum: 5 }
  validates :body, presence: { message: 'is a required field' }, length:
      { minimum: 10 }
end
