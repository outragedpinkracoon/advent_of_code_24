# frozen_string_literal: true

module DayFive
  module PartOne
    def self.run(file_path)
      rules_section, = parse_sections(file_path)
      generate_rules(rules_section)
      # check_rules(rules, updates)
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

    # Takes in an update [75, 47, 61, 53, 29] and checks it against the set of rules
    # {
    #   75 => [47, 61, 53, 29],
    #   47 => [61, 53, 29]
    # } etc
    # Returns true if the update is valid against the rules, false if it is not
    def self.update_is_valid?(rules, update)
      update.each_with_index do |item, index|
        next if index.zero? # first value is always before everything

        must_come_after = rules[item]
        before_me = update[0...index]
        intersection = must_come_after & before_me
        return false unless intersection.empty?
      end
      true
    end

    def self.check_updates(rules, updates)
      updates.map do |update|
        update_is_valid?(rules, update)
      end
    end
  end
end
