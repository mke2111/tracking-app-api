class Measurement < ApplicationRecord
  validates :hours, presence: true
  validates :measure_id, presence: true
  validates :user_id, presence: true
  belongs_to :users
  belongs_to :measures

  before_save do |m|
    measure = m.measure
    m.memory = measure.memory * m.hours
  end
end
