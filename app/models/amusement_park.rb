class AmusementPark < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :admission_price

  has_many :rides
end
