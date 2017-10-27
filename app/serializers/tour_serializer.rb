class TourSerializer < ActiveModel::Serializer
  attributes :id, :date, :vacancies, :arrival_time, :departure_time
  
  has_one :route
end
