class Tour < ApplicationRecord
  validate :validate_guide

  belongs_to :route
  belongs_to :user
  has_many :sales

  def validate_guide
    if self.user.guide? == false
      errors.add(:user, 'Invalid User Type')
    end
  end

end
