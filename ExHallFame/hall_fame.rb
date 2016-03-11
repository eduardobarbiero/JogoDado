class HallFame
  attr_accessor :player
  
  def initialize
    @player = []
  end	
  
  class Player    
    attr_accessor :nome
	attr_accessor :point
  end  
    
  def top_10    
	begin      
	  new_player = Player.new	  
	  new_player.nome = "Ninguem jogando"
	  player << new_player
	  player
	rescue => e
	  p e.to_s
    end
  end
  
  def set_players    
    hall = HallFame.new
	i = -1
    for i in 1..11
	  player = HallFame::Player.new
	  player.nome = "Jogador " + i.to_s
	  player.point = Random.rand(100)
	  hall.player << player
	end	
	hall.player
  end	
  
  def sort players    
    sorted = players.sort {|x,y| y.point<=>x.point}	
	sorted
  end
  
  def sort_first_10 players        
    sorted = players.first(10).sort {|x,y| y.point<=>x.point}	
	sorted
  end
end

class Main
  def initialize
    begin
      #hall = HallFame.new
	  #p hall.top_10

	  hall = HallFame.new	  
	  hall.sort(hall.set_players)
	  jogo = gets
    rescue => e
      p e.to_s
    end  	
  end
end	

Main.new #jogar
