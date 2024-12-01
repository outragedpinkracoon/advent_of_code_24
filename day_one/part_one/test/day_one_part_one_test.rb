# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../lib/day_one_part_one'

class DayOnePartOneTest < Minitest::Test
  def test_can_parse_data
    dopo = DayOnePartOne.new('day_one/part_one/data/test_data.txt')

    assert_equal([1, 2, 3, 3, 3, 4], dopo.set_one)
    assert_equal([3, 3, 3, 4, 5, 9], dopo.set_two)
  end
end
