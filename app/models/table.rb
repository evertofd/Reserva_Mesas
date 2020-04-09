class Table < ApplicationRecord
  belongs_to :space
  has_many :reservation
end
