require "optparse"

class Arguments
  HELP = "--help"
  LIST = "--list"
  NEW = "--new"
  STOP = "--stop"
  PRINT = "--print"
    
  attr_reader :command, :taskname, :banner
    
  def initialize(command_line_args)
    @command = PRINT
    
    parser = OptionParser.new do |parser|
      parser.on("-h", "#{HELP}", "Display this help") do
        @command = HELP
      end
      parser.on("-n", "#{NEW} TASKNAME", "Create a new task 'TASKNAME'") do |taskname|
        @command = NEW
        @taskname = taskname
      end
      parser.on("-s", STOP, "Close the last task.") do
        @command = STOP
      end
      parser.on("-l", LIST, "Lists all tasks") do
        @command = LIST
      end
      parser.on("-r", PRINT, "Creates a report over all tasks (default)") do
        @command = PRINT
      end
    end
      
    @banner = parser.to_s
    
    begin
      parser.parse!(command_line_args)
    rescue
      raise "Error while parsing command line\n#{@banner}"
    end
  end
end
