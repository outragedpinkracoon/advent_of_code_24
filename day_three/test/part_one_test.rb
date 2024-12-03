# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_one'
require 'pry-byebug'

class DayThreePartOneTest < Minitest::Test
  def test_can_parse_data
    result = DayThree::PartOne.run('day_three/data/test_data.txt')

    assert_equal(4, result)
  end
end
