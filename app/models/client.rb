class Client < ApplicationRecord
  has_many :schedulings
  has_many :sales, through: :schedulings
end
