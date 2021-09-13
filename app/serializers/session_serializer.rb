class SessionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :created_at, :total_time
  has_many :tasks
  belongs_to :user

  def total_time
    instance_options[:total_time]
  end
end
