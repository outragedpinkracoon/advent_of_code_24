# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_one'
require 'pry-byebug'

class DayFivePartOneTest < Minitest::Test
  def test_can_parse_sections
    result = DayFive::PartOne.parse_sections('day_five/data/small_test_data.txt')
    expected_rules_section = [
      [75, 47], [75, 61], [75, 53], [75, 29], [47, 61], [47, 53], [47, 29], [61, 53], [61, 29],
      [53, 29], [29, 13]
    ]

    expected_updates_section = [[75, 47, 61, 53, 29], [75, 97, 47, 61, 53]]

    assert_equal(expected_rules_section, result[0])
    assert_equal(expected_updates_section, result[1])
  end

  def test_can_generate_rules
    input = [
      [75, 47], [75, 61], [75, 53], [75, 29], [47, 61], [47, 53], [47, 29], [61, 53], [61, 29],
      [53, 29], [29, 13]
    ]

    expected = {
      75 => [47, 61, 53, 29],
      47 => [61, 53, 29],
      61 => [53, 29],
      53 => [29],
      29 => [13]
    }
    result = DayFive::PartOne.generate_rules(input)

    assert_equal(expected, result)
  end

  def test_returns_valid_update
    rules = {
      75 => [47, 61, 53, 29],
      47 => [61, 53, 29],
      61 => [53, 29],
      53 => [29],
      29 => [13]
    }

    update = [75, 47, 61, 53, 29]
    result = DayFive::PartOne.update_is_valid?(rules, update)

    assert(result)
  end

  def test_returns_invalid_update
    rules = {
      75 => [47, 61, 53, 29],
      47 => [61, 53, 29],
      61 => [53, 29],
      97 => [75],
      53 => [29],
      29 => [13]
    }

    update = [75, 97, 47, 61, 53]
    result = DayFive::PartOne.update_is_valid?(rules, update)

    refute(result)
  end

  def test_can_check_updates
    rules = {
      75 => [47, 61, 53, 29],
      47 => [61, 53, 29],
      61 => [53, 29],
      97 => [75],
      53 => [29],
      29 => [13]
    }

    updates = [[75, 47, 61, 53, 29], [75, 97, 47, 61, 53]]
    result = DayFive::PartOne.check_updates(rules, updates)
    expected = [true, false]

    assert_equal(expected, result)
  end
end
