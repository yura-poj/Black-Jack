# frozen_string_literal: true

require_relative 'dispenser'

module ActWithCarts
  attr_accessor :bank, :score, :carts

  def initialize
    @dispenser = Dispenser.new
    @bank = 100
    all_again
  end

  def add_cart
    add_cart!(@dispenser.give_cart)
  end

  def all_again
    @score = 0
    @carts = []
    2.times { add_cart }
    @bank -= 10
  end

  private

  def add_cart!(values)
    cart, score = values
    score = cart_ace if cart == :T
    @carts << cart
    @score += score
  end

  def cart_ace
    return 1 if @score + 11 > 21

    11
  end
end
