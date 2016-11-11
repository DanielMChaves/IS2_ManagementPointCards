class Card < ActiveRecord::Base
  # Relation 1-Card : n-Purchases
  has_many :purchases

  # Default values
  before_create :set_default_values

  def set_default_values
    self.points = 0
    self.status = true
  end
end
