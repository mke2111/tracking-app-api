class Measurement < ApplicationRecord
  validates :hours, presence: true
  validates :measure_id, presence: true
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :measure

  before_save do |t|
    t.memory = 1.5 * t.hours
  end
end
