class Order < ActiveRecord::Base
	belongs_to :user
	has_many :items
	belongs_to :restaurant
	belongs_to :menu
	
end
