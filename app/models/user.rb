class User < ActiveRecord::Base
  # user = 0  client = 1 salesman = 2 guide = 3
  enum user_type: [:user, :manager, :salesman, :guide]

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          #:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

end
