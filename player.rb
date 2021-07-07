# frozen_string_literal: true

require_relative 'act_with_carts'

class Player
  include ActWithCarts
  def initialize(name)
    super()
    @name = name
  end
end
