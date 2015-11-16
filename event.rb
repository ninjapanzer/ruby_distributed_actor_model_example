require 'data_mapper'
require 'dm-migrations'

class Event
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :start,      DateTime  # A varchar type string, for short strings
  property :duration,   Integer   # Minutes for the event
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.

  def print
    "#{id}-#{start}-#{duration}-#{body}"
  end
end

DataMapper.auto_upgrade!
