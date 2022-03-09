class Game
  def initialize(name)
    @name = name
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end

  def begin_game
    puts ("Start of a new game. Welcome #{@player1} and #{@player2}")
    switch
  end

  def show_lives
    puts ("P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3")
  end

  def new_question(player)
    prompt_question = Question.new
    prompt_question.print_question(player.name)
    print("> ")
    @answer = gets.chomp
    if prompt_question.verify_answer(@answer.to_i)
      puts ("YES! You are correct")
    else
      puts ("#{player.name} Seriously? No!")
      player.lose_life
    end
    check_stats
  end

  def switch
    while @player1.lives > 0 || @player2.lives > 0 do
      new_question(@player1)
      new_question(@player2)
      show_lives
      puts ("--NEW TURN--")
    end
  end

  def winner(player)
    puts ("#{player.name} wins with a score of #{player.lives}/3")
    puts ("--GAME OVER--")
    exit(0)
  end

  def check_stats
    if @player1.lost_game
      winner(@player2)
    elsif @player2.lost_game
      winner(@player1)
    end
  end
end
