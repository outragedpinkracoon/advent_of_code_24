# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../lib/day_two_part_one'

class DayTwoPartOneTest < Minitest::Test
  def test_can_parse_data
    result = DayTwo::PartOne.parse('day_two/part_one/data/test_data.txt')

    assert_equal([7, 6, 4, 2, 1], result[0])
    assert_equal(6, result.count)
  end

  def test_can_check_all_increasing
    result = DayTwo::PartOne.all_increasing?([7, 6, 4, 2, 1])

    refute(result)

    result = DayTwo::PartOne.all_increasing?([1, 2, 4, 6, 7])

    assert(result)
  end
end
