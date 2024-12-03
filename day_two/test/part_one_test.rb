# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_one'
require 'pry-byebug'

class DayTwoPartOneTest < Minitest::Test
  def test_can_parse_data
    result = DayTwo::PartOne.parse('day_two/data/test_data.txt')

    assert_equal([7, 6, 4, 2, 1], result[0])
    assert_equal(6, result.count)
  end

  def test_can_check_all_increasing
    result = DayTwo::PartOne.all_increasing?([7, 6, 4, 2, 1])

    refute(result)

    result = DayTwo::PartOne.all_increasing?([1, 2, 4, 6, 7])

    assert(result)

    result = DayTwo::PartOne.all_increasing?([1, 2, 6, 4, 7])

    refute(result)
  end

  def test_can_check_all_decreasing
    result = DayTwo::PartOne.all_decreasing?([7, 6, 4, 2, 1])

    assert(result)

    result = DayTwo::PartOne.all_decreasing?([1, 2, 4, 6, 7])

    refute(result)

    result = DayTwo::PartOne.all_decreasing?([1, 2, 6, 4, 7])

    refute(result)
  end

  def test_can_check_acceptable_difference
    test_cases = {
      [7, 6, 4, 2, 1] => true,   # Safe
      [1, 2, 7, 8, 9] => false,  # Unsafe: increase of 5
      [9, 7, 6, 2, 1] => false,  # Unsafe: decrease of 4
      [1, 3, 6, 7, 9] => true    # Safe
    }

    test_cases.each do |input, expected|
      result = DayTwo::PartOne.acceptable_difference?(input)

      assert_equal(expected, result, "Failed for input: #{input.inspect}")
    end
  end

  def test_can_check_safe
    test_cases = {
      [7, 6, 4, 2, 1] => true,   # Safe
      [1, 2, 7, 8, 9] => false,  # Unsafe: increase of 5
      [9, 7, 6, 2, 1] => false,  # Unsafe: decrease of 4
      [1, 3, 2, 4, 5] => false,  # Unsafe: increasing, then decreasing
      [8, 6, 4, 4, 1] => false,  # Unsafe: no increase/decrease
      [1, 3, 6, 7, 9] => true    # Safe
    }

    test_cases.each do |input, expected|
      result = DayTwo::PartOne.safe?(input)

      assert_equal(expected, result, "Failed for input: #{input.inspect}")
    end
  end

  def test_returns_correct_count
    result = DayTwo::PartOne.run('day_two/data/test_data.txt')

    assert_equal(2, result)
  end
end
