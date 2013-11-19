class Moment < ActiveRecord::Base
	belongs_to :restaurant
	has_many :slots
end
