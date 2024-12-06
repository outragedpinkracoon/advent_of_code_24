# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_one'
require 'pry-byebug'

class DayFivePartOneTest < Minitest::Test
  def test_returns_correct_answer_for_input_file
    result = DayFive::PartOne.run('day_five/data/small_test_data.txt')
    expected_rules_section = [
      [75, 47], [75, 61], [75, 53], [75, 29], [75, 47], [47, 61], [47, 53], [47, 29], [61, 53], [61, 29],
      [53, 29]
    ]

    expected_updates_section = [[75, 47, 61, 53, 29], [75, 97, 47, 61, 53]]

    assert_equal(expected_rules_section, result[0])
    assert_equal(expected_updates_section, result[1])
  end
end
