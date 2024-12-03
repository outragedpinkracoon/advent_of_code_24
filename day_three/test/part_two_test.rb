# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_two'
require 'pry-byebug'

class DayThreePartTwoTest < Minitest::Test
  def test_can_return_correct_result
    result = DayThree::PartTwo.run('day_three/data/test_data_part_2.txt')

    assert_equal(48, result)
  end
end
