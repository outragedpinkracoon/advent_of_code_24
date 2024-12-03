# frozen_string_literal: true

module DayThree
  module PartOne
    def self.run(file_path)
      regex = /mul\(\d{1,3},\d{1,3}\)/

      File.readlines(file_path)[0]
          .scan(regex)
          .count
    end
  end
end
