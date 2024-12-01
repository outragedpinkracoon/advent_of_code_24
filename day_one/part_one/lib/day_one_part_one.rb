# frozen_string_literal: true

module DayOnePartOne
  # takes in the path to the file and returns the sum of the differences
  # between the numbers when they are ordered smallest to biggest in pairs.
  def self.run(file_path)
    set_one, set_two = parse(file_path)
    diffs = match(set_one, set_two)
    diffs.sum
  end

  # returns a 'tuple' with the first set of numbers [1,3,2] and the second [4,4,5]
  # in this format [[1,3,2], [4,4,5]]
  def self.parse(file_path)
    File.readlines(file_path).each_with_object([[], []]) do |item, tuple|
      parts = item.split # e.g "3   6" becomes [3,6]
      tuple[0] << parts[0].to_i
      tuple[1] << parts[1].to_i
    end
  end

  # take two arrays [1,3,2], [4,4,5] sorts them from smallest to biggest
  # and returns the diff between the two numbers [3,1,3]
  def self.match(set_one, set_two)
    diffs = []
    sorted_set_one = set_one.sort
    sorted_set_two = set_two.sort

    sorted_set_one.each_with_index do |item, index|
      diffs << (item - sorted_set_two[index]).abs
    end

    diffs
  end
end
