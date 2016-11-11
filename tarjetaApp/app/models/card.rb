class Card < ActiveRecord::Base
  after_initialize :set_default_values

  def set_default_values
    self.points = 0
    self.status = true
  end
end
