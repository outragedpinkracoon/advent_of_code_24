# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../lib/day_one_part_two'

class DayOnePartTwoTest < Minitest::Test
  def test_can_find_similarties
    set_one = [3, 4, 2, 1, 3, 3]
    set_two = [4, 3, 5, 3, 9, 3]

    result = DayOne::PartTwo.similarities(set_one, set_two)

    assert_equal([9, 4, 0, 0, 9, 9], result)
  end

  def test_can_create_correct_result
    result = DayOne::PartTwo.run('day_one/part_one/data/test_data.txt')

    assert_equal(31, result)
  end
end
