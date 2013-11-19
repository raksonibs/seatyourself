class Slot < ActiveRecord::Base
	belongs_to :moment
	def to_datetime(t)
    # Convert seconds + microseconds into a fractional number of seconds
    	seconds = sec + Rational(t.sec, 10**6)

    # Convert a UTC offset measured in minutes to one measured in a
    # fraction of a day.
    	offset = Rational(t.utc_offset, 60 * 60 * 24)
    	DateTime.new(year, month, day, hour, min, seconds, offset)
  end
end
