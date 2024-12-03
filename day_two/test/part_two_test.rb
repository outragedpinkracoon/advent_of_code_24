# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_two'
require 'pry-byebug'

class DayTwoPartTwoTest < Minitest::Test
  def test_creates_permatuation
    result = DayTwo::PartTwo.variations([7, 6, 4, 2])
    expected = [[6, 4, 2], [7, 4, 2], [7, 6, 2], [7, 6, 4]]

    assert_equal(expected, result)
  end

  def test_can_check_safe
    test_cases = {
      [7, 6, 4, 2, 1] => true,   # Safe
      [1, 2, 7, 8, 9] => false,  # Unsafe regardless
      [9, 7, 6, 2, 1] => false,  # Unsafe regardless
      [1, 3, 2, 4, 5] => true,  # Safe if dampened
      [8, 6, 4, 4, 1] => true,  # Safe if dampened
      [1, 3, 6, 7, 9] => true # Safe
    }

    test_cases.each do |input, expected|
      result = DayTwo::PartTwo.any_safe?(input)

      assert_equal(expected, result, "Failed for input: #{input.inspect}")
    end
  end

  def test_returns_correct_count
    result = DayTwo::PartTwo.run('day_two/data/test_data.txt')

    assert_equal(4, result)
  end
end
