# frozen_string_literal: true

class DayOnePartOne
  attr_reader :set_one, :set_two

  def initialize(file_path)
    @file_path = file_path
    @set_one = []
    @set_two = []

    parse
    sort
  end

  private

  attr_reader :file_path

  def parse
    File.foreach(file_path) do |line|
      parts = line.split
      set_one << parts[0].to_i
      set_two << parts[1].to_i
    end
  end

  def sort
    @set_one.sort!
    @set_two.sort!
  end
end
