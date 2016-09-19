require 'part2.rb'

describe "#rps_game_winner" do
  it "should be defined" do
    expect(lambda {rps_game_winner([["X", "P"], ["Y", "S"]])}).not_to raise_error
  end

  it "should raise WrongNumberOfPlayersError if there are not exactly two players" do
    expect(lambda { rps_game_winner([ ["Allen", "S"] ]) }).to raise_error(WrongNumberOfPlayersError)
  end

  it "should raise NoSuchStrategyError if either player's strategy something other than 'R', 'P', or 'S'" do
    expect(lambda {rps_game_winner([["Joe", "S"], ["Aaron", "F"]])}).to raise_error(NoSuchStrategyError)
  end

  it "should return the player who submitted rock against scissors" do
    expect(rps_game_winner([["Joe", "R"], ["Aaron", "S"]])).to eq(["Joe", "R"])
  end

  it "should return the player who submitted paper against rock'" do
    expect(rps_game_winner([["Mary", "P"], ["Paul", "R"]])).to eq(["Mary", "P"])
  end

  it "should return the player who submitted scissors against paper'" do
    expect(rps_game_winner([["Jim", "S"], ["Gordo", "P"]])).to eq(["Jim", "S"])
  end

  it "should return return the first player in the event of a tie" do
    expect(rps_game_winner([["Mary", "P"], ["Paul", "P"]])).to eq(["Mary", "P"])
  end
end

describe "#rps_tournament_winner" do
  it "should be defined" do
    expect(lambda { rps_tournament_winner([["X", "P"], ["Y", "S"]]) }).not_to raise_error
  end
  it "should return the winner of the tournament" do
    expect(rps_tournament_winner [[[ ["Joe", "P"], ["Mary", "S"] ],   [ ["Bob", "R"],  ["Alice", "S"] ] ], [    [ ["Steve", "S"], ["Jane", "P"] ],   [ ["Ted", "R"], ["Carol", "P"] ] ]]).to eq(["Bob", "R"])
  end
end
