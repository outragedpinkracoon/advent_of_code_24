# frozen_string_literal: true

module DayTwo
  module PartTwo
    # Check the safety of the reports using the new tolerance where we can drop an item
    # from the report like it never happened and consider it safe.
    def self.run(file_path)
      reports = DayTwo::PartOne.parse(file_path)
      count_safe(reports)
    end

    # Count the number of reports that are safe based on the new safety tolerance
    def self.count_safe(reports)
      reports.count do |report|
        any_safe?(report)
      end
    end

    # Generate all variations of a report and check if any of them are safe
    def self.any_safe?(report)
      variations(report).any? { |a| DayTwo::PartOne.safe?(a) }
    end

    # For a given report [7, 6, 4, 2] generates all variations with a number removed
    # [[6, 4, 2], [7, 4, 2], [7, 6, 2], [7, 6, 4]]
    def self.variations(report)
      report.each_index.map do |index|
        new_array = report.dup
        new_array.delete_at(index)
        new_array
      end
    end
  end
end
