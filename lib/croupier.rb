require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  return "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  if player_score > 21
    return "Bust, you lose"
  elsif player_score == 21
    return "Black Jack! you win."
  elsif player_score > bank_score
    return "You beat the bank! You win."
  elsif player_score < bank_score
    return "You lost"
  elsif player_score == bank_score
    return "Push, money back"
  end
end

def play_game
  puntos_banco = pick_bank_score
  puntos_jugador = 0
  loop do
    puts "Card? 'y' or 'yes' to get a new card"
    respuesta = gets.chomp
    if ['yes', 'y'].include?(respuesta)
      puntos_jugador += pick_player_card
      puts state_of_the_game(puntos_jugador, puntos_banco)
    else
      break
    end
  end
  puts end_game_message(puntos_jugador, puntos_banco)
end

