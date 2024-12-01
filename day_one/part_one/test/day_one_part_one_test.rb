# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../lib/day_one_part_one'

class DayOnePartOneTest < Minitest::Test
  def test_can_parse_data
    set_one, set_two = DayOne::PartOne.parse('day_one/part_one/data/test_data.txt')

    assert_equal([3, 4, 2, 1, 3, 3], set_one)
    assert_equal([4, 3, 5, 3, 9, 3], set_two)
  end

  def test_can_match_data
    set_one = [3, 4, 2, 1, 3, 3]
    set_two = [4, 3, 5, 3, 9, 3]
    diffs = DayOne::PartOne.match(set_one, set_two)

    assert_equal([2, 1, 0, 1, 2, 5], diffs)
  end

  def test_can_return_the_correct_result
    result = DayOne::PartOne.run('day_one/part_one/data/test_data.txt')

    assert_equal(11, result)
  end
end
