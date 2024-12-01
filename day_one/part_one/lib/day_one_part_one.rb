# frozen_string_literal: true

class DayOnePartOne
  attr_reader :set_one, :set_two, :diffs, :sum

  def initialize(file_path)
    @file_path = file_path
    @set_one = []
    @set_two = []
    @diffs = []

    parse
    sort
    match
    @sum = diffs.sum
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

  def match
    @set_one.each_with_index do |item, index|
      @diffs << (item - @set_two[index]).abs
    end
  end
end
