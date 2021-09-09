class Measurement < ApplicationRecord
  belongs_to :users
  belongs_to :measures
end
