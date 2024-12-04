# frozen_string_literal: true

module DayFour
  module PartOne
    def self.run(file_path, word)
      input = File.readlines(file_path, chomp: true)
      grid = map_to_coords(input)
      limit = word.length
      diagonals = find_diagonals(grid, limit: limit)
      verticals = find_verticals(grid, limit: limit)
      horizonals = find_horizontals(grid, limit: limit)
      all_dimensions = diagonals + verticals + horizonals
      just_letters = just_letters(all_dimensions)
      find_word_count(just_letters, word)
    end

    # In a diagonal, the diff between row and col is always constant. Whether it's 0,
    # 1 or -1, it just indicates *which diagonal* a set of letters belongs to.
    # group by returns a construct like this
    # {
    # 0 => [['X', 1, 1], ['M', 2, 2], ['A', 3, 3], ['S', 4, 4]], # Main diagonal
    # -1 => [['B', 1, 2], ['X', 2, 3], ['J', 3, 4]]             # Off-diagonal
    # }
    # We then filter out any diagonals that are less than the length of the
    # word we are looking for, because those are invalid.
    def self.find_diagonals(grid, limit:)
      top_left_to_bottom_right = grid.group_by { |(_, row, col)| row - col }
      top_right_to_bottom_left = grid.group_by { |(_, row, col)| row + col }

      diagonals = top_left_to_bottom_right.values + top_right_to_bottom_left.values
      diagonals.select { |diag| diag.size >= limit }
    end

    def self.find_horizontals(grid, limit:)
      # Grouping by row to find horizontal sequences
      rows = grid.group_by { |(_, row, _)| row }

      # Select rows where the number of elements meets or exceeds the limit
      rows.values.select { |row| row.size >= limit }
    end

    def self.find_verticals(grid, limit:)
      # Grouping by column to find vertical sequences
      columns = grid.group_by { |(_, _, col)| col }

      # Select columns where the number of elements meets or exceeds the limit
      columns.values.select { |column| column.size >= limit }
    end

    # takes an array of co-ords and finds how many times the word is in it
    # input = [[["X", 1, 1], ["M", 2, 2], ["A", 3, 3], ["S", 4, 4]]]
    def self.find_word_count(letter_sets, word)
      count = 0
      letter_sets.each do |set|
        set.each_cons(word.length) do |segment|
          check = segment.join

          next unless check == word || check == word.reverse

          count += 1
        end
      end
      count
    end

    # Keep only the first element (letter) from each triplet
    def self.just_letters(coord_list)
      coord_list.map do |batch|
        batch.map { |entry| entry[0] }
      end
    end

    # takes in an array like ["XZZZ", "ZMZZ", "ZZAZ", "ZZZS"] and maps each item
    # to it's relevant co-ordinate in a matrix e.g. [["X", 1, 1], "Z", 1, 2]
    def self.map_to_coords(input)
      row_number = 1
      input.each_with_object([]) do |row, obj|
        row.each_char.with_index do |letter, index|
          obj << [letter, row_number, index + 1]
        end
        row_number += 1
      end
    end
  end
end
