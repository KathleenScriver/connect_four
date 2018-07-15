require 'minitest/autorun'
require 'minitest/pride'
require './lib/piece'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_starts_with_7_columns_with_6_periods
    board = Board.new

    actual = board.columns.values.count
    expected = 7

    assert_equal expected, actual

    all_periods = true
    actual = board.columns.values.each do |spots|
                  if spots.uniq != ["."]
                    all_periods = false
                  end
                end
    assert_equal true, all_periods
  end

  def test_columns_can_be_updated
    board = Board.new

    board.columns["A"][0] = "X"
    expected = board.columns["A"]
    actual = ["X", ".", ".", ".", ".", "."]

    assert_equal expected, actual
  end 

  def test_it_prints_board
    board = Board.new

    expected =
    "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n......."

    assert_equal expected, board.print_board
  end


    def test_it_finds_next_spot_in_column
      skip
      board = Board.new
      turn = Turn.new("A")

      expected = board.columns["A"][0]
      actual = turn.find_spot

      assert_equal expected, actual
    end


end
