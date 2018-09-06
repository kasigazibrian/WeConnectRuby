class Business < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :business_email, presence: true, format: Devise.email_regexp
end
