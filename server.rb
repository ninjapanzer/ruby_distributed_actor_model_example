# Load the DRb library
require 'drb'
require 'json'

require_relative './data_mapper_helper.rb'
require_relative './event.rb'

EVENT_ACTOR_URI = 'druby://localhost:9000'

Event.create({start: Time.now, duration: 10, body: "HEY"})

class EventActor
  def add(event)
    Event.create( start: event[:start], duration: event[:duration], body: event[:body] )
  end

  def list
    Event.all.to_json
  end

  def get(id)
    Event.get(id).to_json
  end
end

# Start the service
DRb.start_service(EVENT_ACTOR_URI, EventActor.new)


puts "Server running on #{EVENT_ACTOR_URI}"
# Make the main thread wait for the DRb thread,
# otherwise the script execution would already end here.
DRb.thread.join
