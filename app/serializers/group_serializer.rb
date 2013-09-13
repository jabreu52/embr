class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users, through: :group_users
  embed :ids, include: true
end
