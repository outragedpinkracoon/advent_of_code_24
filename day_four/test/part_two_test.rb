# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_two'
require 'pry-byebug'

class DayFourPartTwoTest < Minitest::Test
  def test_can_find_x_shapes
    input = [
      ['M', 1, 1], ['B', 1, 2], ['S', 1, 3],
      ['E', 2, 1], ['A', 2, 2], ['X', 2, 3],
      ['M', 3, 1], ['I', 3, 2], ['S', 3, 3]
    ]

    groupings = DayFour::PartTwo.find_x_shapes(input)

    expected = [[%w[S A M], %w[M A S]]]

    assert_equal(expected, groupings)
  end

  # Full answer is 1939
  def test_can_run_on_test_file
    result = DayFour::PartTwo.run('day_four/data/part_two_test_data.txt')

    assert_equal(9, result)
  end
end
