require 'drb/drb'
require 'json'

event_actor = DRbObject.new_with_uri('druby://localhost:9000')

DRb.start_service

puts event_actor.inspect

quit = false

puts "Options: \n\
\tlist - list serialized data \n\
\tadd - add an arbitrary event \n\
\tget - get an event by id \n\
\tq - quit"

while(!quit)
  printf "Enter: "
  option = gets.chomp
  if(option == "add")
    puts event_actor.add( start: Time.now, duration: 10, body: "NOPE" )
  elsif(option == "list")
    puts JSON.parse(event_actor.list)
  elsif(option == "get")
    printf "ID?: "
    id = gets.chomp.to_i
    puts JSON.parse(event_actor.get(id))
  elsif(option == "q")
    quit = true
  end
end

#puts event_actor.list
