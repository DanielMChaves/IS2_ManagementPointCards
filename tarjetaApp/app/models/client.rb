class Client < ActiveRecord::Base
  # Relation 1-Client : n-Cards
  has_many :cards

  self.primary_key = 'id'
  
  validates :id, presence: true
  #validates :dni, presence: true
  validates :name, presence: true
  validates	:surname, presence: true
  validates	:tlf, presence: true
  validates	:email, presence: true
  validates	:address, presence: true
end
