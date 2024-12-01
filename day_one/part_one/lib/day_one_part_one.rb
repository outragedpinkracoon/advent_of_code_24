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
      File.readlines(file_path).map do |line|
        line.split.map(&:to_i) # array of pairs like [[3,4], [4,3]]
      end.transpose # puts together like [[3,4], [4,3]]
    end

    # take two arrays [1,3,2], [4,4,5] sorts them from smallest to biggest
    # and returns the diff between the two numbers [3,1,3]
    def self.match(set_one, set_two)
      set_one
        .sort
        # make the two arrays into one as pairs e.g. [1,2] and [3,3] => [[1, 3], [2, 3]]
        .zip(set_two.sort)
        # takes nested arrays and returns absoute diff
        .map { |item1, item2| (item1 - item2).abs }
    end
  end
end
