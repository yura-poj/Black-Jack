# frozen_string_literal: true

class Dispenser
  SUITS = %i[s h d c].freeze
  CARTS = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, J: 10, L: 10, K: 10, T: [1, 11] }.freeze

  def give_cart
    key = random_key
    [key, CARTS[key]]
  end

  private

  def random_key
    CARTS.keys.sample
  end
end
