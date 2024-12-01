# frozen_string_literal: true

module DayOne
  module PartOne
    # takes in the path to the file and returns the sum of the differences
    # between the numbers when they are ordered smallest to biggest in pairs.
    def self.run(file_path)
      set_one, set_two = parse(file_path)
      match(set_one, set_two).sum
    end

    # returns a 'tuple' with the first set of numbers [1,3,2] and the second [4,4,5]
    # in this format [[1,3,2], [4,4,5]]
    def self.parse(file_path)
      File.readlines(file_path).each_with_object([[], []]) do |item, (set_one, set_two)|
        parts = item.split # e.g "3   6" becomes [3,6]
        set_one << parts[0].to_i
        set_two << parts[1].to_i
      end
    end

    # take two arrays [1,3,2], [4,4,5] sorts them from smallest to biggest
    # and returns the diff between the two numbers [3,1,3]
    def self.match(set_one, set_two)
      sorted_set_two = set_two.sort

      set_one
        .sort
        .each_with_index
        .with_object([]) do |(item, index), diffs|
        diffs << (item - sorted_set_two[index]).abs
      end
    end
  end
end
