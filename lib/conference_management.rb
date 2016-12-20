require "./lib/conference_management/version"
require "./lib/conference_management/file_parser"
require "./lib/conference_management/planner"
require "./lib/conference_management/printer"
require 'date'

module ConferenceManagement
  list = FileParser.new('./data/talks.txt')
  planner = Planner.new
  result = planner.plan list, [180, 180, 240, 240]
  printer = Printer.new
  printer.printer(result)
end

