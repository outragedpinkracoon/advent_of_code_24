# frozen_string_literal: true

require_relative '../../../test_helper'
require_relative '../lib/day_two_part_one'

class DayTwoPartOneTest < Minitest::Test
  def test_can_parse_data
    result = DayOne::PartTwo.run('day_one/part_one/data/test_data.txt')

    assert(result)
  end
end
