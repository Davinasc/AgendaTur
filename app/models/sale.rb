class Sale < ApplicationRecord
  before_save :set_receive_price
  validate :validate_salesman

  belongs_to :user
  belongs_to :tour
  
  has_many :schedulings
  has_many :clients, through: :schedulings

  def set_receive_price
    self.receive_price = self.total_price - self.voucher_price
  end

  def validate_salesman
    if self.user.salesman? == false
      errors.add(:user, 'Invalid User Type')
    end
  end

end
