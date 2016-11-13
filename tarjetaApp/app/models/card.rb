class Card < ActiveRecord::Base
  # Relation 1-Card : n-Purchases
  has_many :purchases

  # Relation  n-Cards : 1-Client
  belongs_to :client

  # Default values
  before_create :set_default_values

  def increase_points(cents)
    points = ((cents - 1) / 100.0).round

    self.points = self.points + points
    self.save
  end

  def set_default_values
    self.points = 0
    self.status = true
  end
end
