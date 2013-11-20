class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, :through=> :reservations
	has_many :moments
	has_many :slots, through: :moments
    has_many :menus
    has_many :items, :through => :menus
    has_many :orders
    has_many :items, :through => :orders

	def to_datetime(t)
    # Convert seconds + microseconds into a fractional number of seconds
    	seconds = sec + Rational(t.sec, 10**6)

    # Convert a UTC offset measured in minutes to one measured in a
    # fraction of a day.
    	offset = Rational(t.utc_offset, 60 * 60 * 24)
    	DateTime.new(year, month, day, hour, min, seconds, offset)
  end
end
