class TourSerializer < ActiveModel::Serializer
  attributes :id, :date, :vacancies, :arrival_time, :departure_time
  has_one :route
  has_one :user, key: :guide
end
