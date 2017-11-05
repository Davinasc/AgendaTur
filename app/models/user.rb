class User < ActiveRecord::Base
  # user = 0  client = 1 salesman = 2 guide = 3 manager = 4
  enum user_type: [:user, :manager, :salesman, :guide, :user_manager]

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          #:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :tours
  has_many :sales
end
