require 'date'
module ConferenceManagement
  class Printer
    def printer(result)
      result.each_with_index do |res, res_index|
        if res_index.odd?
           if res_index == 1 
             puts "Track 1"
           end
           time = DateTime.new(2016, 12, 20, 9, 0, 0, -1) if res_index < 2
           time = DateTime.new(2016, 12, 20, 13, 0, 0, -1) if res_index > 1
           res.talks.each do |talk|
             format = format('%02d:%02d %s', time.hour, time.minute, talk.description)
             puts format
             newtime = time + Rational(talk.length, 1440)
             time = newtime
           end
           if res_index < 2
             puts "12:00PM Lunch"
           else
             puts "05:00PM Networking Event"
           end
        end
      end 
      result.each_with_index do |res, res_index|
        if res_index.even?
           if res_index == 0
             puts "Track 2"
           end
           time = DateTime.new(2016, 12, 20, 9, 0, 0, -1) if res_index < 2
           time = DateTime.new(2016, 12, 20, 13, 0, 0, -1) if res_index > 1
           res.talks.each do |talk|
             format = format('%02d:%02d %s', time.hour, time.minute, talk.description)
             puts format
             newtime = time + Rational(talk.length, 1440)
             time = newtime
           end
           if res_index < 2
             puts "12:00PM Lunch"
           else
             puts "05:00PM Networking Event"
           end
        end
      end 
    end
  end
end
