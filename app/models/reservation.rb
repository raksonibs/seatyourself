class Reservation < ActiveRecord::Base
	belongs_to :restuarant
	belongs_to :user
end
