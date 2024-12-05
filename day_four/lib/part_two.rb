# frozen_string_literal: true

module DayFour
  module PartTwo
    def self.run(file_path, word)
      input = File.readlines(file_path, chomp: true)

      grid = map_to_coords(input)
      limit = word.length

      all_valid_sequences = all_valid_sequences(grid, limit: limit)
      just_letters = extract_letters(all_valid_sequences)

      count_word_occurrences(just_letters, word)
    end

    # Collect sequences from all dimensions - diagonal, horizonta and vertical
    def self.all_valid_sequences(grid, limit:)
      find_diagonals(grid, limit: limit) +
        find_horizontals(grid, limit: limit) +
        find_verticals(grid, limit: limit)
    end

    # Finds all valid diagonals (top-left ↘ and top-right ↙)
    #
    # In a diagonal, the diff between row and col is always constant. Whether it's 0,
    # 1 or -1, it just indicates *which diagonal* a set of letters belongs to.
    # group by returns a construct like this
    # {
    # 0 => [['X', 1, 1], ['M', 2, 2], ['A', 3, 3], ['S', 4, 4]], # Main diagonal
    # -1 => [['B', 1, 2], ['X', 2, 3], ['J', 3, 4]]             # Off-diagonal
    # }
    # We then filter out any diagonals that are less than the length of the
    # word we are looking for, because those are invalid.
    #
    # flatten(1) flattens one level e.g [1, [2, [3]]] => [1, 2, [3]]

    def self.find_diagonals(grid, limit:)
      diagonals = [
        grid.group_by { |(_, row, col)| row - col }.values,
        grid.group_by { |(_, row, col)| row + col }.values
      ].flatten(1) # merge the two sets
      # only select entries that are longer than the length of the word (anything)
      # shorter wouldn't match the word and is invalid
      diagonals.select { |diag| diag.size >= limit }
    end

    # Finds valid horizontal sequences by grouping by row
    def self.find_horizontals(grid, limit:)
      grid.group_by { |(_, row, _)| row }
          .values
          .select { |row| row.size >= limit }
    end

    # Finds valid vertical sequences by grouping by column
    def self.find_verticals(grid, limit:)
      grid.group_by { |(_, _, col)| col }
          .values
          .select { |col| col.size >= limit }
    end

    # takes an array of letters and finds how many times the word is in it
    # input = [["X", "M", "X", "M"],["B", "X", "J"]]
    def self.count_word_occurrences(letter_sets, word)
      word_length = word.length
      # count how many times the word appears in a given set
      letter_sets.sum do |set|
        # map out segments of the set based on the word length e.g.
        # [["X", "M"], ["M", "X"], ["X", "M"]] if it was two for ["X", "M", "X", "M"]
        sets = set.each_cons(word_length)
        # join the segment ["M", "X"] into "MX" and see if matches the searched for word
        sets.count { |segment| segment.join == word || segment.join == word.reverse }
      end
    end

    # Extracts letters from coordinate lists
    # [[["M", 1, 1], ["S", 2, 2]]] => [["M"], ["S"]]
    def self.extract_letters(coord_list)
      coord_list.map { |coord| coord.map(&:first) }
    end

    # Converts an input array like ["XZZZ", "ZMZZ"] into coordinates [["X", 1, 1], ["Z", 1, 2]]
    def self.map_to_coords(input)
      input.each_with_object([]).with_index(1) do |(row, coords), row_number|
        row.each_char.with_index { |letter, col| coords << [letter, row_number, col + 1] }
      end
    end
  end
end
