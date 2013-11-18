class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	#validates :betweenhours

	def betweenhours
		Reservation.find_by_id(params[:id])
	end
end
