# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../lib/day_one_part_one'

class DayOnePartOneTest < Minitest::Test
  def setup
    @dopo = DayOnePartOne.new('day_one/part_one/data/test_data.txt')
  end

  def test_can_parse_data
    assert_equal([1, 2, 3, 3, 3, 4], @dopo.set_one)
    assert_equal([3, 3, 3, 4, 5, 9], @dopo.set_two)
  end

  def test_can_match_data
    @dopo = DayOnePartOne.new('day_one/part_one/data/test_data.txt')

    assert_equal([2, 1, 0, 1, 2, 5], @dopo.diffs)
  end

  def test_can_sum
    @dopo = DayOnePartOne.new('day_one/part_one/data/test_data.txt')

    assert_equal(11, @dopo.sum)
  end
end
