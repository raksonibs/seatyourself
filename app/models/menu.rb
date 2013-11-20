class Menu < ActiveRecord::Base
	belongs_to :restaurant
	has_many :items
	has_many :orders
end
