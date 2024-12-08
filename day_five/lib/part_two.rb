# frozen_string_literal: true

module DayFive
  module PartTwo
    def self.run(file_path)
      rules_section, updates = DayFive::PartOne.parse_sections(file_path)
      rules = DayFive::PartOne.generate_rules(rules_section)

      # Reorder invalid updates
      invalid_updates = updates.reject { |update| DayFive::PartOne.valid_update?(rules, update) }
      reordered_updates = invalid_updates.map { |update| reorder_update(rules, update) }

      # Find the middle page numbers of reordered updates and sum them
      reordered_updates.map { |update| DayFive::PartOne.middle(update) }.sum
    end

    def self.reorder_update(rules, update)
      # Build a graph for the pages in the current update
      graph = Hash.new { |hash, key| hash[key] = [] }
      in_degree = Hash.new(0)

      # Only consider the rules relevant to the current update
      update_set = update.to_set
      rules.each do |key, values|
        next unless update_set.include?(key)

        values.each do |value|
          next unless update_set.include?(value)

          graph[key] << value
          in_degree[value] += 1
        end
      end

      # Perform topological sort
      sorted = []
      queue = update.select { |page| in_degree[page].zero? } # Start with pages having no dependencies

      until queue.empty?
        current = queue.shift
        sorted << current

        graph[current].each do |neighbor|
          in_degree[neighbor] -= 1
          queue << neighbor if in_degree[neighbor].zero?
        end
      end

      sorted
    end
  end
end
