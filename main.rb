# frozen_string_literal: true

require_relative 'diller'
require_relative 'player'
require_relative 'desk'

class Play
  GREETING = 'Welcome, enter your name: '
  PLAY_INSTRUCTION = '1 - skip 2 - get cart 3 - open'
  METHODS = { 1 => :skip, 2 => :add_cart, 3 => :finish_round }.freeze

  def initialize
    @diller = Diller.new
  end

  def start
    init_player
    init_desk
    play
  end

  private

  def init_player
    print GREETING
    @player = Player.new(gets.chomp)
    show_carts
  end

  def init_desk
    @desk = Desk.new(player: @player, diller: @diller)
  end

  def play
    loop do
      puts PLAY_INSTRUCTION
      send METHODS[gets.to_i]
      show_carts
      @desk.finish_round && new_round! if @desk.round_finished?
    end
  end

  def skip
    @diller.stroke
  end

  def add_cart
    @player.add_cart
    @diller.stroke
  end

  def finish_round
    @desk.finish_round
    new_round!
  end

  def new_round!
    puts 'Enter 1 to continue or enter to leave'
    Process.kill 9, Process.pid if gets.to_i != 1
    start_new_round
  end

  def show_carts
    puts "Your score - #{@player.score}, your carts - #{@player.carts}"
  end

  def start_new_round
    @player.all_again
    @diller.all_again
    show_carts
  end
end

#__END__
a = Play.new
a.start