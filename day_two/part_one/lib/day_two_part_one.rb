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
      all_increasing?(report) &&
        all_decreasing?(report)
    end

    def self.all_increasing?(report)
      current_number = report.first
      report[1..report.count].each do |item|
        if current_number < item
          current_number = item
          next
        end
        return false
      end
      true
    end

    def self.all_decreasing?(report)
      current_number = report.first
      report[1..report.count].each do |item|
        if current_number > item
          current_number = item
          next
        end
        return false
      end
      true
    end
  end
end
