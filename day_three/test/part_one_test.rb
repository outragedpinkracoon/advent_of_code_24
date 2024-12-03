# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_one'
require 'pry-byebug'

class DayThreePartOneTest < Minitest::Test
  # 161289189 on full data set
  def test_can_return_correct_result
    result = DayThree::PartOne.run('day_three/data/test_data.txt')

    assert_equal(161, result)
  end

  def test_can_mulitply_the_matches
    input = ['mul(2,4)', 'mul(5,5)', 'mul(11,8)', 'mul(8,5)']
    result = DayThree::PartOne.mulitply_results(input)

    assert_equal(161, result)
  end
end
