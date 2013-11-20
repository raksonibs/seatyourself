class Item < ActiveRecord::Base
	belongs_to :menu
	belongs_to :order
	belongs_to :user
	belongs_to :restaurant
end
