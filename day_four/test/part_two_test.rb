# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_two'
require 'pry-byebug'

class DayFourPartTwoTest < Minitest::Test
  def test_can_find_diagonals
    input = [
      ['M', 1, 1], ['B', 1, 2], ['S', 1, 3],
      ['E', 2, 1], ['A', 2, 2], ['X', 2, 3],
      ['M', 3, 1], ['I', 3, 2], ['S', 3, 3]
    ]

    groupings = DayFour::PartTwo.find_diagonals(input, limit: 3)

    expected = [
      [['M', 1, 1], ['A', 2, 2], ['S', 3, 3]],
      [['S', 1, 3], ['A', 2, 2], ['M', 3, 1]]
    ]

    assert_equal(expected, groupings)
  end
end
