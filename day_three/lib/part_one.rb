# frozen_string_literal: true

module DayThree
  module PartOne
    def self.parse(file_path)
      File.readlines(file_path)[0]
    end
  end
end
