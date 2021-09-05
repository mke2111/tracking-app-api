class Measurement < ApplicationRecord
  validates :hours, :measure_id, :user_id, presence: true
  belongs_to :user
  belongs_to :measure

  before_save do |m|
    measure = m.measure
    m.memory = measure.memory * m.hours
  end
end
