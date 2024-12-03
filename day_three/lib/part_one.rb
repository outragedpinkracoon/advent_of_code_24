# frozen_string_literal: true

module DayThree
  module PartOne
    def self.run(file_path)
      input = File.read(file_path)
      matches = find_matches(input)
      mulitply_results(matches)
    end

    # match only the pattern mul(num,num) where num is 1-3 digits with no whitespace etc
    def self.find_matches(input)
      regex = /mul\(\d{1,3},\d{1,3}\)/
      input.scan(regex)
    end

    # takes in matches and mulitplies the result together
    # ['mul(2,3)', 'mul(4,5)'] => 6 + 20 = 26
    def self.mulitply_results(input)
      # Extract the pairs of numbers and calculate the products
      multiples = input.map do |item|
        # Extract the numbers as a pair using a regex
        pair = item.scan(/\d+/).map(&:to_i)
        # Multiply the two numbers
        pair.reduce(:*)
      end
      multiples.sum
    end
  end
end
