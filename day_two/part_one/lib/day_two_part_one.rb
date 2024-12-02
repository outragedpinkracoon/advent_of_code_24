# frozen_string_literal: true

module DayTwo
  module PartOne
    def self.run(file_path)
      reports = parse(file_path)
      check_safety(reports)
    end

    def self.parse(file_path)
      File.readlines(file_path).map do |line|
        line.split.map(&:to_i)
      end
    end

    def self.check_safety(reports)
      reports.map do |report|
        safe?(report)
      end
    end

    def self.safe?(report)
      (all_increasing?(report) || all_decreasing?(report)) &&
        acceptable_difference?(report)
    end

    # Check if all levels in a report are increasing
    def self.all_increasing?(report)
      current = report.first
      report[1..report.count].each do |item|
        if current < item
          current = item
          next
        end
        return false
      end
      true
    end

    # Check if all levels in a report are decreasing
    def self.all_decreasing?(report)
      current = report.first
      report[1..report.count].each do |item|
        if current > item
          current = item
          next
        end
        return false
      end
      true
    end

    # Check if any two adjacent levels in a report differ by at least one and at most three.
    def self.acceptable_difference?(report)
      current = report.first
      report[1..report.count].each do |item|
        diff = (current - item).abs
        if diff >= 1 && diff <= 3
          current = item
          next
        end
        return false
      end
      true
    end
  end
end
