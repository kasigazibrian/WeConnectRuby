require 'elasticsearch/model'

class Business < ApplicationRecord
  include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  belongs_to :user
  has_many :reviews
  belongs_to :category
  validates :business_name, presence: { message: 'is a required field' }
  validates :business_email, presence: { message: 'is a required field' }, format: Devise.email_regexp
  validates_format_of :contact_number,
                      with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/
end
