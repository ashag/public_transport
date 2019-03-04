require 'csv'

content = File.read('./db/stops.csv')
# stop_id,x,y
csv = CSV.parse(content, headers: true)

csv.each do |row|
  Stop.create(sid: row[0], x_coord: row[1], y_coord: row[2], quadrant: 1)
end

content = File.read('./db/lines.csv')
# line_id,line_name
csv = CSV.parse(content, headers: true)
csv.each do |row|
  Line.create(lid: row[0], line_name: row[1])
end

content = File.read('./db/times.csv')
# line_id,stop_id,time
csv = CSV.parse(content, headers: true)
csv.each do |row|
  line = Line.find_by(lid: row[0])
  stop = Stop.find_by(sid: row[1])
  Route.create(line: line, stop: stop, arrival_time: row[2], departure_time: row[2])
end

content = File.read('./db/delays.csv')
# line_name,delay
csv = CSV.parse(content, headers: true)
csv.each do |row|
  line = Line.find_by(line_name: row[0])
  Delay.create(line: line, delay_in_minutes: row[1].to_i)
end
