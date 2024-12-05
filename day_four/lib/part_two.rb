# frozen_string_literal: true

module DayFour
  module PartTwo
    def self.run(file_path)
      input = File.readlines(file_path, chomp: true)

      grid = DayFour::PartOne.map_to_coords(input)

      find_x_shapes(grid).count
    end

    # Define the co-ords of each part of the x
    def self.coords_of_x(center_row, center_col)
      top_left = [center_row - 1, center_col - 1]
      top_right = [center_row - 1, center_col + 1]
      bottom_left = [center_row + 1, center_col - 1]
      bottom_right = [center_row + 1, center_col + 1]
      [top_left, top_right, bottom_left, bottom_right]
    end

    def self.x_shapes_for_letters(grid)
      # Iterate through all possible center points of the cross shape
      grid.each_with_object([]) do |(letter, center_row, center_col), matches|
        # Not an X-MAS if the centre isn't A
        next unless letter == 'A'

        # find the surrounding X for the letter
        coords_of_x = coords_of_x(center_row, center_col)

        # Check if all coordinates of the X exist in the grid (any with 0 or
        # larger than the grid width/height won't appear in the hash)
        next unless coords_of_x.all? { |coord| grid_by_coords(grid)[coord] }

        # add valid match
        matches << [coords_of_x, letter]
      end
    end

    # Group cells by row and column so we can look them up easier later e.g
    # {[1, 1]=>[[".", 1, 1]], [1, 2]=>[["M", 1, 2]] }
    def self.grid_by_coords(grid)
      grid.group_by { |(_, row, col)| [row, col] }
    end

    def self.find_x_shapes(grid)
      x_shapes = []

      x_shapes_for_letters(grid).each do |(coords_of_x, letter)|
        # Pull out the letters from the co-ords
        letters = extract_letters(letter, grid_by_coords(grid), *coords_of_x)
        # Check for the "MAS" pattern in diagonals
        diagonals = make_diagonals(letters)
        # Skip if the diagonals are not X-MAS
        next unless matches_word(*diagonals)

        # Store valid results
        x_shapes << diagonals
      end
      x_shapes
    end

    # construct the letters into the top right -> bottom left and top left ->
    # bottom right diagonal
    # input = {:top_left=>"M", :center=>"A", :top_right=>"S", :bottom_left=>"M", :bottom_right=>"S"}
    # output = [["S", "A", "M"], ["M", "A", "S"]]
    def self.make_diagonals(letters)
      top_right = [letters[:top_right], letters[:center], letters[:bottom_left]]
      top_left = [letters[:top_left], letters[:center], letters[:bottom_right]]

      [top_right, top_left]
    end

    # Extract letters from the co-ordinate sets
    def self.extract_letters(letter, grid_by_coords, top_left, top_right, bottom_left, bottom_right)
      {
        top_left: grid_by_coords[top_left].first[0],
        center: letter,
        top_right: grid_by_coords[top_right].first[0],
        bottom_left: grid_by_coords[bottom_left].first[0],
        bottom_right: grid_by_coords[bottom_right].first[0]
      }
    end

    # takes in letters in this format
    # {:top_left=>"M", :center=>"A", :top_right=>"S", :bottom_left=>"M", :bottom_right=>"S"}
    # and checks if the diagonal shape would be an X-MAS
    def self.matches_word(top_right_diagonal, top_left_diagonal)
      [%w[M A S], %w[S A M]].include?(top_right_diagonal) &&
        [%w[M A S], %w[S A M]].include?(top_left_diagonal)
    end
  end
end
