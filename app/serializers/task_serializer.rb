class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :session_id, :created_at
end
