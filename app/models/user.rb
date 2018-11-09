class User < ApplicationRecord
  has_many :businesses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:username]
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :gender, inclusion: %w[male female]

  def to_param
    id.to_s(36)
  end

end
