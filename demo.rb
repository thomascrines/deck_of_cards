require_relative('deck')
require_relative('card')
require_relative('hand')

deck = Deck.new()

puts "Press any key to create a new deck"
gets

puts "Here is the initialised deck:"
puts deck.to_bash_coloured_string

puts "Press any key to shuffle the deck"
gets

deck.shuffle
puts "Here is the shuffled deck:"
puts deck.to_bash_coloured_string

puts "How many hands should we deal?"
hand_count = gets.chomp.to_i

puts "How many cards in each hand?"
card_count = gets.chomp.to_i

hands = deck.deal_hands(hand_count, card_count)

puts "Here are your hands"

for hand_number in (1..hand_count)
  puts "hand #{hand_number}:"
  puts hands[hand_number - 1].to_bash_coloured_string
end
