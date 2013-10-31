# spec/sleeping_king_studios/ext/integer/digits_spec.rb

require 'sleeping_king_studios/ext/spec_helper'

require 'sleeping_king_studios/ext/integer/digits'

RSpec.describe Integer do
  describe '#digits' do
    specify { expect(5).to respond_to(:digits).with(0..1).arguments }

    specify 'returns an Array' do
      expect(5.digits).to be_a Array
    end # specify

    expected_values = {
      0 => %w(0),
      5 => %w(5),
      10 => %w(1 0),
      50 => %w(5 0),
      100 => %w(1 0 0),
      500 => %w(5 0 0),
      1000 => %w(1 0 0 0),
      5000 => %w(5 0 0 0),
      10000 => %w(1 0 0 0 0),
      15151 => %w(1 5 1 5 1),
      3141592654 => %w(3 1 4 1 5 9 2 6 5 4),
      -1 => %w(- 1),
      -5 => %w(- 5),
      -10 => %w(- 1 0),
      -50 => %w(- 5 0),
      -100 => %w(- 1 0 0),
      -15151 => %w(- 1 5 1 5 1)
    } # end expected values

    expected_values.each do |integer, array|
      specify "#{integer} => '#{array}'" do
        expect(integer.digits).to be == array
      end # specify
    end # each

    context 'with base 2' do
      expected_values = {
        0 => %w(0),
        1 => %w(1),
        2 => %w(1 0),
        3 => %w(1 1),
        4 => %w(1 0 0),
        5 => %w(1 0 1),
        6 => %w(1 1 0),
        7 => %w(1 1 1),
        8 => %w(1 0 0 0),
        80 => %w(1 0 1 0 0 0 0)
      } # end expected values

      expected_values.each do |integer, array|
        specify "#{integer} => '#{array}'" do
          expect(integer.digits 2).to be == array
        end # specify
      end # each
    end # context

    context 'with base 16' do
      expected_values = {
        0 => %w(0),
        8 => %w(8),
        10 => %w(a),
        11 => %w(b),
        12 => %w(c),
        13 => %w(d),
        14 => %w(e),
        15 => %w(f),
        16 => %w(1 0),
        80 => %w(5 0),
        128 => %w(8 0),
        256 => %w(1 0 0),
        800 => %w(3 2 0)
      } # end expected values

      expected_values.each do |integer, array|
        specify "#{integer} => '#{array}'" do
          expect(integer.digits 16).to be == array
        end # specify
      end # each
    end # context
  end # describe
end # describe
