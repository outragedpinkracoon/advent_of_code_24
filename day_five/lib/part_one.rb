# frozen_string_literal: true

module DayFive
  module PartOne
    def self.run(file_path)
      parse_sections(file_path)
    end

    def self.parse_sections(file_path)
      file_content = File.read(file_path)

      # Split the content into two parts based on the empty line
      parts = file_content.split("\n\n")

      # Access each part
      rules = parts[0]
      updates = parts[1]
      [rules, updates]
    end

    def generate_rules(ruleset); end
  end
end
