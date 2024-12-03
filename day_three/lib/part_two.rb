# frozen_string_literal: true

module DayThree
  module PartTwo
    def self.run(file_path)
      input = File.read(file_path)
      matches = find_matches(input)
      filtered_matches = filter(matches)
      DayThree::PartOne.mulitply_results(filtered_matches)
    end

    # matches the mul(1,2) pairs from before but also any do and don't blocks.
    # returns ["mul(2,4)", "don't()", "mul(5,5)", "mul(11,8)", "do()", "mul(8,5)"]
    def self.find_matches(input)
      regex = /mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/
      input.scan(regex)
    end

    # filters out the mul pairs based on if do is enabled or not
    def self.filter(matches)
      enabled = true
      matches.each_with_object([]) do |item, obj|
        case item
        when 'do()' then enabled = true
        when "don't()" then enabled = false
        else obj << item if enabled
        end
      end
    end
  end
end
