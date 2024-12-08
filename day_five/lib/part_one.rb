# frozen_string_literal: true

module DayFive
  module PartOne
    def self.run(file_path)
      rules_section, = parse_sections(file_path)
      generate_rules(rules_section)
    end

    # Take a list of rules like this [[75, 47], [47, 61], [47, 53],[53, 29], [29, 13]]
    # and returns them grouped into a hash like this
    #     {
    #       75 => [47, 61, 53, 29],
    #       47 => [61, 53, 29],
    #     }
    def self.generate_rules(rules_section)
      output = Hash.new { |hash, key| hash[key] = [] }
      rules_section.each_with_object(output) do |rule, obj|
        obj[rule[0]] << rule[1]
      end
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
