# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../lib/part_one'
require 'pry-byebug'

class DayFourPartOneTest < Minitest::Test
  def test_can_return_co_ords
    input = %w[XZZZ ZMZZ ZZAZ ZZZS]
    result = DayFour::PartOne.map_to_coords(input)

    expected = [
      ['X', 1, 1], ['Z', 1, 2], ['Z', 1, 3], ['Z', 1, 4],
      ['Z', 2, 1], ['M', 2, 2], ['Z', 2, 3], ['Z', 2, 4],
      ['Z', 3, 1], ['Z', 3, 2], ['A', 3, 3], ['Z', 3, 4],
      ['Z', 4, 1], ['Z', 4, 2], ['Z', 4, 3], ['S', 4, 4]
    ]

    assert_equal(expected, result)
  end

  def test_can_find_horizontals
    input = [
      ['X', 1, 1], ['M', 1, 2], ['A', 1, 3], ['S', 1, 4],
      ['E', 2, 1], ['M', 2, 2], ['X', 2, 3], ['G', 2, 4],
      ['H', 3, 1], ['I', 3, 2], ['A', 3, 3], ['J', 3, 4],
      ['D', 4, 1], ['K', 4, 2], ['J', 4, 3], ['M', 4, 4]
    ]

    result = DayFour::PartOne.find_horizontals(input, limit: 4)
    expected = [
      [['X', 1, 1], ['M', 1, 2], ['A', 1, 3], ['S', 1, 4]],
      [['E', 2, 1], ['M', 2, 2], ['X', 2, 3], ['G', 2, 4]],
      [['H', 3, 1], ['I', 3, 2], ['A', 3, 3], ['J', 3, 4]],
      [['D', 4, 1], ['K', 4, 2], ['J', 4, 3], ['M', 4, 4]]
    ]

    assert_equal(expected, result)
  end

  def test_can_find_verticals
    input = [
      ['X', 1, 1], ['I', 1, 2], ['A', 1, 3], ['S', 1, 4],
      ['M', 2, 1], ['M', 2, 2], ['X', 2, 3], ['G', 2, 4],
      ['A', 3, 1], ['I', 3, 2], ['A', 3, 3], ['J', 3, 4],
      ['S', 4, 1], ['K', 4, 2], ['J', 4, 3], ['M', 4, 4]
    ]

    result = DayFour::PartOne.find_horizontals(input, limit: 4)
    expected = [
      [['X', 1, 1], ['I', 1, 2], ['A', 1, 3], ['S', 1, 4]],
      [['M', 2, 1], ['M', 2, 2], ['X', 2, 3], ['G', 2, 4]],
      [['A', 3, 1], ['I', 3, 2], ['A', 3, 3], ['J', 3, 4]],
      [['S', 4, 1], ['K', 4, 2], ['J', 4, 3], ['M', 4, 4]]
    ]

    assert_equal(expected, result)
  end

  def test_can_find_diagonals
    input = [
      ['X', 1, 1], ['B', 1, 2], ['C', 1, 3], ['M', 1, 4],
      ['E', 2, 1], ['M', 2, 2], ['X', 2, 3], ['G', 2, 4],
      ['H', 3, 1], ['I', 3, 2], ['X', 3, 3], ['J', 3, 4],
      ['D', 4, 1], ['K', 4, 2], ['J', 4, 3], ['M', 4, 4]
    ]

    groupings = DayFour::PartOne.find_diagonals(input, limit: 2)

    expected = [
      [['X', 1, 1], ['M', 2, 2], ['X', 3, 3], ['M', 4, 4]],
      [['B', 1, 2], ['X', 2, 3], ['J', 3, 4]],
      [['C', 1, 3], ['G', 2, 4]],
      [['E', 2, 1], ['I', 3, 2], ['J', 4, 3]],
      [['H', 3, 1], ['K', 4, 2]],
      [['B', 1, 2], ['E', 2, 1]],
      [['C', 1, 3], ['M', 2, 2], ['H', 3, 1]],
      [['M', 1, 4], ['X', 2, 3], ['I', 3, 2], ['D', 4, 1]],
      [['G', 2, 4], ['X', 3, 3], ['K', 4, 2]],
      [['J', 3, 4], ['J', 4, 3]]
    ]

    assert_equal(expected, groupings)
  end

  def test_can_count_word_occurences
    input = [%w[X M X M], # XM, MX (nested), XM
             %w[B X J],
             %w[C G],
             %w[E I J],
             %w[H K],
             %w[B E],
             %w[C M H],
             %w[M X I D], # MX
             %w[G X K],
             %w[J J]]
    result = DayFour::PartOne.count_word_occurrences(input, 'XM')

    assert_equal(4, result)
  end

  # # 2547 is correct answer on full set
  def test_returns_correct_answer_for_input_file
    result = DayFour::PartOne.run('day_four/data/test_data.txt', 'XMAS')

    assert_equal(18, result)
  end

  def test_can_convert_co_ords_to_letters
    input = [[['M', 1, 1], ['S', 2, 2]], [['A', 1, 2]]]
    result = DayFour::PartOne.extract_letters(input)

    expected = [%w[M S], %w[A]]

    assert_equal(expected, result)
  end
end
