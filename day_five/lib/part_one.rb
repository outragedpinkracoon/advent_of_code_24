# frozen_string_literal: true

module DayFive
  module PartOne
    class << self
      # Main entry point to run the program
      # Reads the file, parses rules and updates, validates updates, and calculates the result
      def run(file_path)
        rules_section, updates = parse_sections(file_path)
        rules = generate_rules(rules_section)
        check_updates(rules, updates)
        # Filter valid updates and sum the middle values
      end

      def check_updates(rules, updates)
        updates.select { |update| valid_update?(rules, update) }
               .map { |update| middle(update) }
               .sum
      end

      # Generate rules as a hash from the given list of rule pairs
      # Example input: [[75, 47], [47, 61]]
      # Example output: { 75 => [47], 47 => [61] }
      def generate_rules(rules_section)
        rules_section.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |(key, value), rules|
          rules[key] << value
        end
      end

      # Parse the rules and updates sections from the file content
      # Splits the file into two parts: rules section and updates section
      def parse_sections(file_path)
        rules_content, updates_content = File.read(file_path).split("\n\n")
        [parse_section(rules_content, '|'), parse_section(updates_content, ',')]
      end

      # Parse a single section of the file into an array of arrays
      # Example input: "75|47\n47|61", delimiter: '|'
      # Example output: [[75, 47], [47, 61]]
      def parse_section(content, delimiter)
        content.lines.map { |line| line.split(delimiter).map(&:to_i) }
      end

      # Check if an update is valid according to the given rules
      # An update is valid if no number in the update violates the order rules
      # Example: [75, 47, 61] is valid if 75 must come before 47 and 61
      def valid_update?(rules, update)
        update.each_with_index do |item, index|
          next if index.zero? # Skip the first item; it has no "before" constraints

          # Find conflicting numbers (must come after the current number but appear earlier in the update)
          invalid = rules[item] & update[0...index]
          return false unless invalid.empty?
        end
        true
      end

      # Find the middle element of an array
      # Returns -1 if the array has an even length
      def middle(array)
        array.size.odd? ? array[array.size / 2] : -1
      end
    end
  end
end
