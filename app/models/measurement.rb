class Measurement < ApplicationRecord
  validates :hours, presence: true
  validates :measure_id, presence: true
  validates :user_id, presence: true
  belongs_to :users
  belongs_to :measures

  before_save do |m|
    measure = m.measure
    m.memory = 1.5 * m.hours
  end
end
