class Restaurant < ActiveRecord::Base
	has_many :reservations
	has many :users, :through=> :reservations
end
