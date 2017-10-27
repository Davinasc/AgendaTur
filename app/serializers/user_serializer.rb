class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :image, :email, :phone
  attribute :qualification, if: :is_guide?
  attribute :comission, if: :is_salesman?

  def is_guide?
    object.guide?
  end

  def is_salesman?
    object.salesman?
  end

end
