class Measure < ApplicationRecord
  validates :name, presence: true
  has_many :measurements
end
