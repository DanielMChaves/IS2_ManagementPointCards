class Card < ActiveRecord::Base
  # Relation 1-Card : n-Purchases
  has_many :purchases

  # Relation  n-Cards : 1-Client
  belongs_to :client

  # Default values
  after_initialize :set_default_values

  def set_default_values
    self.points = 0
    self.status = true
  end
end
