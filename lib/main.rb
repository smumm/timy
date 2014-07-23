require_relative "teatime"
require_relative "arguments"

args = Arguments.new(ARGV)

filename = "C:/Users/siegemund/Times.txt"

if (args.command == Arguments::LIST)
  TeaTime.list(filename)
elsif (args.command == Arguments::STOP)
  TeaTime.stop(filename)
elsif (args.command == Arguments::NEW)
  TeaTime.new(filename, args.taskname)
elsif (args.command == Arguments::PRINT)
  TeaTime.print(filename)
else
  puts "Invalid argument(s) #{ARGV}"
end