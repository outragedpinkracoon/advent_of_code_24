# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../lib/day_one_part_one'

class DayOnePartOneTest < Minitest::Test
  def test_can_read_file
    dopo = DayOnePartOne.new('day_one/part_one/data/test_data.txt')

    assert(dopo.file_path)
    assert_equal([3, 4, 2, 1, 3, 3], dopo.set_one)
    assert_equal([4, 3, 5, 3, 9, 3], dopo.set_two)
  end
end
