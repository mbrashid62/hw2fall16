class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  player_hash = get_player_hash game
  keys = player_hash.keys
  p1_move = player_hash[keys[0]]
  p2_move = player_hash[keys[1]]
  if is_tie?(p1_move, p2_move)
    game[0]
  else
    if is_p1_winner?(p1_move, p2_move)
      game[0]
    else
      game[1]
    end
  end
end

def rps_tournament_winner(tournament)
  tourn_depth = depth tournament
  if tourn_depth == 2 # if tournament is just one game no need to split into conferences
    rps_game_winner tournament
  else
    player_conferences = div_tourn_into_confs tournament
    play_tournament player_conferences # returns the champion
  end
end

# My Helper functions

# Part A helper functions
def get_player_hash(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  player_hash = Hash.new 0
  game.each do |player|
    raise NoSuchStrategyError unless player[1].upcase == "R" || player[1].upcase == "P" || player[1].upcase == "S"
    player_hash[player[0]] = player[1].upcase
  end
  player_hash
end

def is_tie? (move_one, move_two)
  if move_one == move_two
    true
  else
    false
  end
end

def is_p1_winner? (move_one, move_two)
  if move_one == "R" && move_two == "S"
    true
  elsif move_one == "P" && move_two == "R"
    true
  elsif move_one == "S" && move_two == "P"
    true
  else
    false
  end
end

# Part B helper functions

def div_tourn_into_confs (tournament)
  conference_hash = Hash.new 0
  conf_number = 0
  tournament.each do |conference|
    conference_hash[conf_number] = conference
    conf_number = conf_number + 1
  end
end

def play_tournament conferences
  conf_champs = []
  conferences.each do |conf|
    conf_champs.push(play_for_conf_champ conf) # pla
  end
  rps_game_winner [conf_champs[0], conf_champs[1]] # returns champion
end

def play_for_conf_champ conf
  division_winners = []
  conf.each do |player_div|
     division_winners.push(rps_game_winner player_div) # assume only 2^n players
  end
  play_for_championship division_winners
end

def play_for_championship div_winners
  rps_game_winner div_winners
end

def depth (a)
  return 0 unless a.is_a?(Array)
  return 1 + depth(a[0])
end

