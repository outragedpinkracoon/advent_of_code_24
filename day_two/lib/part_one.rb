# frozen_string_literal: true

module DayTwo
  module PartOne
    # Return the number of reports that are considered safe
    def self.run(file_path)
      reports = parse(file_path)
      count_safe(reports)
    end

    # Read in a file of reports and map them to arrays of integers like [7, 6, 4, 2, 1]
    def self.parse(file_path)
      File.readlines(file_path).map { |line| line.split.map(&:to_i) }
    end

    # Count the number of reports that are considered safe
    def self.count_safe(reports)
      reports.count do |report|
        safe?(report)
      end
    end

    # Returns true if all the numbers increase OR all the numbers decrease AND the
    # difference between the numbers in within an acceptable tolerance.
    def self.safe?(report)
      (all_increasing?(report) || all_decreasing?(report)) &&
        acceptable_difference?(report)
    end

    # Check if all levels in a report are increasing
    def self.all_increasing?(report)
      diffs = report.each_cons(2).map { |a, b| b > a }
      diffs.uniq.count == 1 && diffs.first == true
    end

    # Check if all levels in a report are decreasing
    def self.all_decreasing?(report)
      diffs = report.each_cons(2).map { |a, b| b < a }
      diffs.uniq.count == 1 && diffs.first == true
    end

    # Check if any two adjacent levels in a report differ by at least one and at most three.
    def self.acceptable_difference?(report)
      report.each_cons(2).all? { |a, b| (a - b).abs.between?(1, 3) }
    end
  end
end
