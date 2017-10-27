class TourSerializer < ActiveModel::Serializer
  attributes :id, :date, :vacancies, :arrival_time, :departure_time
  has_one :route
  has_one :user, key: :guide

  belongs_to :user, if: :is_guide?
  belongs_to :route

  def is_guide?
    object.user == 'guide'
  end
end
