# frozen_string_literal: true

module DayThree
  module PartOne
    def self.run(file_path)
      regex = /mul\(\d{1,3},\d{1,3}\)/

      input = File.read(file_path)
      matches = input.scan(regex)
      mulitply_results(matches)
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
