class SaleSerializer < ActiveModel::Serializer
  attributes :id, :total_price, :receive_price, :voucher_price
  has_one :user, key: :salesman
  has_one :tour
  has_many :clients

  belongs_to :user, if: :is_salesman?

  def is_salesman?
    object.user == 'salesman'
  end
end
