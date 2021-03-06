require_relative "../hall_fame"
require "test/unit"
require 'rubygems'
require 'active_support/core_ext/numeric/time'

class HallFameTest < Test::Unit::TestCase  
  def test_top10
    hall = HallFame.new
	expected = 'Ninguem jogando'	
	player = HallFame::Player.new
	player = hall.top_10
    assert_equal(1, player.length)
	assert_equal(expected, player[0].nome)
  end
  
  def test_gamers_sort_first_10
    hall = HallFame.new
    players = set_players
	sorted = hall.sort_first_10(players)
    assert((sorted[0].point.to_i >= sorted[1].point.to_i))  
  end
  
  def test_gamers_sort
    hall = HallFame.new
    players = set_players
	sorted = hall.sort(players)
    assert((sorted[0].point.to_i >= sorted[1].point.to_i))
  end
  
  def test_point_data
    hall = HallFame.new
    players = set_players
	sorted = hall.sort(players)
	assert((sorted[0].date >= sorted[1].date and sorted[0].point.to_i >= sorted[1].point.to_i))
  end
  
  private
  
  def set_players
    hall = HallFame.new
	i = -1
    for i in 1..10
	  player = HallFame::Player.new
	  player.nome = "Jogador " + i.to_s
	  player.point = Random.rand(100)
	  player.date = i.days.from_now
	  hall.player << player
	end	
	hall.player
  end	
end	
