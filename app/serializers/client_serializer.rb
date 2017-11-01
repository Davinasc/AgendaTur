class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :hotel, :apartment, :adult
end
