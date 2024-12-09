# frozen_string_literal: true

require 'tsort'

module DayFive
  module PartTwo
    class TopologicalSorter
      include TSort

      def initialize(rules, update)
        @graph = build_graph(rules, update)
      end

      # Topological sort for the given update
      def sorted_pages
        tsort
      end

      private

      # TSort requires two methods: tsort_each_node and tsort_each_child
      def tsort_each_node(&)
        @graph.each_key(&)
      end

      def tsort_each_child(node, &)
        @graph[node].each(&)
      end

      # Build a graph for the pages in the update
      # rubocop:disable Metrics/MethodLength
      def build_graph(rules, update)
        graph = Hash.new { |hash, key| hash[key] = [] }
        # convert our Array to a Set
        update_set = update.to_set

        # add all numbers from an update to the graph e.g
        # {75=>[], 97=>[], 47=>[], 61=>[], 53=>[]}
        update.each { |page| graph[page] }

        # Populate the graph with edges
        rules.each do |key, values|
          # ensure that the rules only include dependencies relevant to the current update.
          # It prevents unnecessary or invalid operations on pages that are not part
          # of the current update.
          # Given rules = {
          # 75 => [47, 61, 53, 29],
          # 47 => [61, 53, 29],
          # 97 => [75, 13]
          # }
          # and
          # update = [75, 47, 61, 53]
          # Without the next unless update_set.include?(key) check, you would try to include dependencies
          # for 97 and 13, which are irrelevant to this update.
          next unless update_set.include?(key)

          values.each do |value|
            # necessary to ensure that only relevant rules are included
            next unless update_set.include?(value)

            graph[key] << value
          end
        end
        graph
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
