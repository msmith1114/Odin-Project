require 'yaml'

class Hangman
  attr_accessor :word, :word_array, :misses, :guesses, :saved_state

  def initialize
    @word = get_sample.split("")
    @word_array = @word.map {|letter| letter = "_"}
    @misses = 0
    @guesses = []
  end

  def get_sample
    dict = File.readlines("5desk.txt")
    dict.map! do |word|
      word.strip.downcase
    end.select! {|word| word.length.between?(5, 12)}
    dict.sample
  end

  def letter_guess(guess)
    @guesses << guess
    if !@word.include?(guess)
      @misses +=1
    end
    @word.each.with_index do |letter,index|
      if letter == guess
        @word_array[index] = guess
      end
    end
  end

  def show_word
    puts "#{@word_array}"
  end

  def ask_input
    puts "Please enter your next letter, or \"save\" to save game: "
    letter = gets.chomp.downcase
    if letter == "save"
      save_game
    end
    while letter.length > 1
      puts "Your input must only be one letter "
      letter = gets.chomp.downcase
    end
    letter_guess(letter)
  end

  def game_over?
    if @misses > @word.length
      return true
    else
      return false
    end
  end

  def win?
    if !@word_array.include?("_")
      return true
    else
      return false
    end
  end

  def save_game
    puts "Game saved..."
    saved = YAML::dump(self)
    File.open("./saved_game.yml", 'w') { |f| YAML.dump([] << self, f) }
  end

  def load_game
    @saved_state = YAML.load_file("./saved_game.yml")
  end

end


puts "Welcome to Hangman!...."
puts "Enter 'Load' to load a game, or 'New' to start a new one!"
type = gets.chomp.downcase
if type == 'new'
  puts "New Game..."
  sleep(2)
  game = Hangman.new
  until game.game_over? || game.win? do
    puts "Guesses: #{game.guesses.sort}, Lives Left: #{game.word.length-game.misses}"
    game.ask_input
    game.show_word
    if game.win?
      puts "Game over! you win!"
    elsif game.game_over?
      puts "You're out of guesses....you lose"
      puts "#{game.word.join} was the word"
    end
  end
else
  puts "Loading Game..."
  sleep(2)
  loaded_game = Hangman.new
  loaded_game.load_game
  loaded_game.word = loaded_game.saved_state[0].word
  loaded_game.word_array = loaded_game.saved_state[0].word_array
  loaded_game.misses = loaded_game.saved_state[0].misses
  loaded_game.guesses = loaded_game.saved_state[0].guesses
  until loaded_game.game_over? || loaded_game.win? do
    loaded_game.ask_input
    loaded_game.show_word
    if loaded_game.win?
      puts "Game over! you win!"
    elsif loaded_game.game_over?
      puts "You're out of guesses....you lose"
    end
  end

end
