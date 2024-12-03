# frozen_string_literal: true

module DayThree
  module PartTwo
    def self.run(file_path)
      input = File.read(file_path)
      matches = find_matches(input)
      DayThree::PartOne.mulitply_results(matches)
    end

    def matches(input)
    end
  end
end
