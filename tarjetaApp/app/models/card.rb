class Card < ActiveRecord::Base
  # Relation 1-Card : n-Purchases
  has_many :purchases

  # Relation  n-Cards : 1-Client
  belongs_to :client

  # Default values
  before_create :set_default_values

  def self.set_points(card_id, new_value)
    card = Card.find(card_id)
    card.points = new_value
    card.save
  end

  def set_default_values
    self.points = 0
    self.status = true
  end
end
