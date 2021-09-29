class Session < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  scope :tasks_total_time, lambda { |user_id|
                             joins(:tasks)
                               .where('user_id= ?', user_id)
                               .select('sessions.*,SUM(tasks.time) AS total_time')
                               .group('sessions.id')
                           }

  validates :title, presence: true
end
