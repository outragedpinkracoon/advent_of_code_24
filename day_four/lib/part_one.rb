# frozen_string_literal: true

module DayFour
  module PartOne
    def self.run(file_path)
      input = File.readlines(file_path, chomp: true)
      grid = map_to_coords(input)
      diagonals = find_diagonals(grid)
      count = 0
      diagonals.each do |diagonal_list|
        count += find_word_count(diagonal_list, 'XM')
      end
      count
    end

    def self.find_diagonals(grid, limit:)
      # Grouping for top-left to bottom-right (↘) and bottom-right to top-left (↖)
      top_left_to_bottom_right = grid.group_by { |(_, row, col)| row - col }

      # Grouping for top-right to bottom-left (↙) and bottom-left to top-right (↗)
      top_right_to_bottom_left = grid.group_by { |(_, row, col)| row + col }

      valid_diagonals_tl_br = top_left_to_bottom_right.values.select { |diag| diag.size >= limit }
      valid_diagonals_tr_bl = top_right_to_bottom_left.values.select { |diag| diag.size >= limit }

      valid_diagonals_tl_br + valid_diagonals_tr_bl
    end

    # takes an array of co-ords and finds how many times the word is in it
    # input = [[["X", 1, 1], ["M", 2, 2], ["A", 3, 3], ["S", 4, 4]]]
    def self.find_word_count(coord_list, word)
      matches = []
      word_length = word.length
      (0..(coord_list.size - word_length)).each do |start_index|
        segment = coord_list[start_index, word_length]
        matches << segment if segment == word.chars
      end
      matches.count
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
