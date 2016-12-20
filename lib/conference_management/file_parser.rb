require "./lib/conference_management/talk"
module ConferenceManagement
  class FileParser < Array
    def initialize(filename = '')
      File.readlines(filename).each do |line|
       push Talk.new(process_line line)
      end unless filename == ''
    end

    def process_line(line)
      words = line.split
      data = Array
      if words.last == 'lightning'
        length = 5
      elsif /(\d+)min/.match(words.last)
        length = words.last.gsub('min', '').to_i
      else
        fail 'incorrect format'
      end
      data[line, length]
    end
  end
end
