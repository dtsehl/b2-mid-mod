class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating

  belongs_to :amusement_park

  def self.average_thrill_rating
    average(:thrill_rating)
  end
end