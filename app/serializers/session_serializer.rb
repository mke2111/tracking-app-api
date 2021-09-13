class SessionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :created_at
  has_many :tasks
  belongs_to :user
end
