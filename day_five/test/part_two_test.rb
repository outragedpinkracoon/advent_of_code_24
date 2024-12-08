# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_two'
require 'pry-byebug'

class DayFivePartTwoTest < Minitest::Test
  def test_can_reorder_updates
    result = DayFive::PartTwo.run('day_five/data/full_data.txt')

    assert_equal(123, result)
  end
end
