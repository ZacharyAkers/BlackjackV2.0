require_relative 'card'
require_relative 'deck'
require_relative 'player'

money = 100
while money > 0
      $d = Deck.new
      $d.shuffle!
      puts "You have #{money} in your wallet."
      puts "A new deck has been shuffled and there are #{$d.remaining} cards"
      puts "Please place your bet."
      good_bet = false
      while good_bet == false
        bet = Integer(gets.chomp)
        if bet <= money
          good_bet = true
        else
          puts "You cant bet more than #{money}"
        end
      end
      puts bet

$d = Deck.new
$d.shuffle!
puts "A new deck has been shuffled and there are #{$d.remaining} cards"

player = Player.new
puts "Player's hand:"
puts player.to_s
dealer = Player.new

if player.hand_value == 21
  puts "Player wins with BlackJack!"
  puts "Dealer's hand:"
  puts dealer.to_s    
else
  until player.hand_value > 21 
    player.switch_ace
    puts "Do you want to hit(h) or stand(s)?"
    action = $stdin.gets.chomp
    if action == "h" 
      puts "You chose to hit, here's your new hand"
      player.hit
      puts player.to_s
    else
      puts "You chose to stand, here's your final hand"
      puts player.to_s
      break
    end
  end

  puts "Dealer's hand:"
  puts dealer.to_s

  if player.hand_value <= 21
    if player.hand_value > dealer.hand_value
      puts "Player wins"
    elsif player.hand_value == dealer.hand_value
      puts "Dealer and Player tied"
    else
      puts "Dealer wins"
    end
  else
    puts "Player busts. Dealer wins"
  end
end

puts "There are #{$d.remaining} cards in the deck"

end
if money <= 0
  puts "game is over, you have no more money"
end