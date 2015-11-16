require_relative "legacytask"

module Timy

  class TextReport
    @task_map
    @title
    attr_accessor :last_task, :print_total
    
    def initialize(title)
      @task_map = Hash.new
      @title = title
      @last_task = nil
      @print_total = true
    end
    
    def add_task(task)
      @task_map[task.name] = Array.new unless @task_map.has_key?(task.name)
      @task_map[task.name].push(task)
    end

    def print()
      puts "-"*90
      puts @title
      puts "-"*90
      @task_map.each do |name, tasklist|
        print_tasklist(name, tasklist)
      end
      puts "-"*90
      puts sprintf("%-74s%6.2f h", " ", totaltime.round(2)) if @print_total
    end
    
    private
    
    def print_tasklist(name, tasklist)
      total_hours = 0
      tasklist.each do |task|
        total_hours += task.elapsed_hours
      end
      puts sprintf("%-4s%-70s%6.2f h", status(name), name, total_hours.round(2))
    end
    
    def totaltime()
      result = 0
      @task_map.each do |name, tasklist|
        tasklist.each do |task|
          result += task.elapsed_hours
        end
      end
      return result
    end
    
    def status(taskname)
      result = " "
      result = "*" if !@last_task.nil? && taskname == @last_task.name && @last_task.active?
      result = "." if !@last_task.nil? && taskname == @last_task.name && !@last_task.active?
      return result
    end
  end
end
