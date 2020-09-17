require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    hand = ["King", "Queen"]
    score = blackjack_score(hand)
    expect(score).must_equal 20

    hand = ["Jack", "Queen"]
    score = blackjack_score(hand)
    expect(score).must_equal 20

    hand = ["King", 5]
    score = blackjack_score(hand)
    expect(score).must_equal 15

    hand = [7, "Queen"]
    score = blackjack_score(hand)
    expect(score).must_equal 17

    hand = ["Jack", 8]
    score = blackjack_score(hand)
    expect(score).must_equal 18

  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ["Ace", "Queen"]
    score = blackjack_score(hand)
    expect(score).must_equal 21

    hand = ["Ace", "King"]
    score = blackjack_score(hand)
    expect(score).must_equal 21

    hand = ["Ace", 5]
    score = blackjack_score(hand)
    expect(score).must_equal 16

    hand = [5, 3, "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 19

    hand = ["Ace", 8, 2]
    score = blackjack_score(hand)
    expect(score).must_equal 21

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = [10, 2, "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 13

    hand = [7, "King", "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 18

  end

  it 'raises an ArgumentError for invalid cards' do
    hand = [11, 2]
    expect{blackjack_score(hand)}.must_raise ArgumentError

    hand = ["ada", 2]
    expect{blackjack_score(hand)}.must_raise ArgumentError

    hand = [0, 2]
    expect{blackjack_score(hand)}.must_raise ArgumentError

    hand = [0.9, 2]
    expect{blackjack_score(hand)}.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

  end
end
