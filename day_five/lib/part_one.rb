# frozen_string_literal: true

module DayFive
  module PartOne
    def self.run(file_path)
      parse_sections(file_path)
    end

    def self.parse_sections(file_path)
      file_content = File.read(file_path)
      parts = file_content.split("\n\n")

      # rules section, then updates section
      rules = parse_section(parts[0], '|')
      updates = parse_section(parts[1], ',')
      [rules, updates]
    end

    def self.parse_section(section, delimiter)
      section.split("\n").map { |line| line.split(delimiter).map(&:to_i) }
    end
  end
end
