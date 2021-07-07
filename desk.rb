# frozen_string_literal: true

class Desk
  def initialize(player:, diller:)
    @player = player
    @diller = diller
  end

  def finish_round!
    finish_round
  end

  def round_finished?
    @player.carts.size == 3 && @diller.carts.size == 3
  end

  def finish_round
    show_carts
    manage_balance
    show_message
  end

  private

  def show_message
    return puts 'draw' if draw?
    return puts 'win' if win?
    puts 'lose'
  end

  def manage_balance
    return balance_update(to_diller: 10, to_player: 10) if draw?
    return balance_update(to_diller: 0, to_player: 20) if win?
    balance_update(to_diller: 20, to_player: 0)
  end

  def balance_update(to_diller:, to_player:)
    @player.bank += to_player
    @diller.bank += to_diller
  end

  def win?
    @player.score > @diller.score || @diller.score > 21 && @player.score < 21
  end

  def draw?
    @player.score == @diller.score || (@player.score > 21 && @diller.score > 21)
  end

  def show_carts
    puts "Diller's score - #{@diller.score}, diller's carts - #{@diller.carts}"
  end
end
