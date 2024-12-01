# frozen_string_literal: true

class DayOnePartOne
  attr_reader :file_path, :set_one, :set_two

  def initialize(file_path)
    @file_path = file_path
    @set_one = []
    @set_two = []
    parse
  end

  def parse
    File.foreach(file_path) do |line|
      parts = line.split
      set_one << parts[0].to_i
      set_two << parts[1].to_i
    end
  end
end
