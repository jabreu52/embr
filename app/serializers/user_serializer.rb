class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :name, :image
  has_many :groups, through: :group_users
  embed :ids, include: true
end
