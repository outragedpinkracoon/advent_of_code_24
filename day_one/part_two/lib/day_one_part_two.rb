# frozen_string_literal: true

module DayOne
  module PartTwo
    def self.run(file_path)
      set_one, set_two = DayOne::PartOne.parse(file_path)
      similarities = similarities(set_one, set_two)
      similarities.sum
    end

    # Tallies the numbers in the second set e.g {4=>1, 3=>3, 5=>1, 9=>1} for
    # [4, 3, 5, 3, 9, 3] then checks if the numbers in set one appear in this set
    # if so, returns the multiple of the first set * the occurance of it e.g.
    # first set = [3, 4, 2, 1, 3, 3] => 3 => 3 times in set 2 = 9
    def self.similarities(set_one, set_two)
      tallies = set_two.tally

      set_one.each_with_object([]) do |item, similarities|
        count = tallies[item]
        result = count.nil? ? 0 : count * item
        similarities << result
      end
    end
  end
end
