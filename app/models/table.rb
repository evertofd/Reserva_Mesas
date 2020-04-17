class Table < ApplicationRecord
  has_and_belongs_to_many :reservations
  belongs_to :space
  #  belongs_to :space
  #  has_many :reservation
end
