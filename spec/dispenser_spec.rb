# frozen_string_literal: true

require 'spec_helper'
require_relative '../dispenser'

RSpec.describe Dispenser do
  let(:dispenser) { Dispenser.new }
  describe 'give_cart' do
    it 'return random cart' do
      expect(dispenser.give_cart.nil?).to eq false
    end
  end
end
