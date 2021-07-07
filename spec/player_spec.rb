# frozen_string_literal: true

require 'spec_helper'
require_relative '../player'

RSpec.describe Player do
  let(:player) { Player.new('You') }
  describe 'add_cart' do
    before do
      player.send :score=, 0
      player.send :carts=, []
      2.times { player.send :add_cart!, [:T, 12] }
    end
    it 'add cart and score' do
      expect(player.score).to eq(12)
      expect(player.carts).to eq(%i[T T])
    end
  end
end
