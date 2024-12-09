# frozen_string_literal: true

require_relative('topological_sorter')
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
      sorter = DayFive::PartTwo::TopologicalSorter.new(rules, update)
      sorter.sorted_pages
    end
  end
end
