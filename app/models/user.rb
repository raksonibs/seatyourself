class User < ActiveRecord::Base
	has_secure_password
	has_many :categories
	has_many :reservations
	has_many :restaurants, :through=> :reservations
	has_many :orders
	has_many :items, :through=> :orders
end
