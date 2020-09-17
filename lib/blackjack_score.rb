# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
def blackjack_score(hand)

  if hand.length < 2
    puts "Please draw more cards."
    return
  end


  if !(hand - VALID_CARDS).empty?
    raise ArgumentError
  end

  score = 0
  hand.each do |card|
    case card
    when 2, 3, 4, 5, 6, 7, 8, 9, 10
      score += card
    when 'Jack', 'Queen', 'King'
      score += 10
    when 'Ace'
      if score <= 10
        score += 11
      else
        score += 1
      end
    end
  end

  if score > 21
    raise ArgumentError
  end

  return score
end
