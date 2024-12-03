# frozen_string_literal: true

module DayOne
  module PartTwo
    # Read in the file and return the number of similarites between the two sets
    def self.run(file_path)
      set_one, set_two = DayOne::PartOne.parse(file_path)
      similarities(set_one, set_two).sum
    end

    # Checks how many times the number from set one is in set two. Returns the
    # number of times multiplied by the number itself.
    # e.g. [3, 4, 2, 1, 3, 3] => 3 appears 3 times in set 2 = 9
    def self.similarities(set_one, set_two)
      # makes a tally of the counts in the array e.g. {4=>1, 3=>3, 5=>1, 9=>1}
      # for [4, 3, 5, 3, 9, 3]
      tallies = set_two.tally

      # for each item in the first set, see how often it occurs in set two
      set_one.map do |item|
        count = tallies[item]
        # if it appears, multiply it by the number of occurances
        count.nil? ? 0 : count * item
      end
    end
  end
end
