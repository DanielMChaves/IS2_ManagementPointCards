class Purchase < ActiveRecord::Base
  # Relation n-Purchases : 1-Card
  belongs_to :card
end
