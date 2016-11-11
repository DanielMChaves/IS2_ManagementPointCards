class Client < ActiveRecord::Base
	validates :dni, presence: true
	validates :name, presence: true
	validates	:surname, presence: true
	validates	:tlf, presence: true
	validates	:email, presence: true
	validates	:address, presence: true
end
