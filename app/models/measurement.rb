class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :measure
end
