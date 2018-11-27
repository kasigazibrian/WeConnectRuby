# frozen_string_literal: true

# Class for business model
class Business < ApplicationRecord
  acts_as_paranoid
  searchkick word_middle: %i[business_name]
  belongs_to :user
  has_many :reviews
  belongs_to :category
  validates :business_name, presence: { message: 'is a required field' },
                            uniqueness: { message: 'has already been taken' }
  validates :business_email, presence: { message: 'is a required field' },
                             format: Devise.email_regexp, uniqueness:
                { message: 'has already been taken' }
  validates :contact_number, uniqueness: { message: 'already exists' }
  validates_format_of :contact_number,
                      with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
  # scope :by_name, ->(name) { where('business_name ilike ?', "%#{name}%") }
  # scope :category, ->(category_id) { where category_id: category_id }
  # scope :location, ->(location) { where location: location }
  # def after_save
  #   Business.reindex
  # end
end
