class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  belongs_to :tour
end
