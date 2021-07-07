# frozen_string_literal: true

require_relative 'act_with_carts'

class Diller
  include ActWithCarts
  def stroke
    add_cart if @score < 17
  end
end
