# spec/sleeping_king_studios/ext/integer/romanize_spec.rb

require 'sleeping_king_studios/ext/spec_helper'

require 'sleeping_king_studios/ext/integer/romanize'

RSpec.describe Integer do
  describe '#romanize' do
    specify { expect(5).to respond_to(:romanize).with(0..1).arguments }

    specify 'returns a String' do
      # expect(5).to be_a String
    end # specify

    context 'with a number <= 0' do
      specify 'raises an error' do
        expect {
          0.romanize
        }.to raise_error(
          RangeError,
          /within range 1 to 4999/
        ) # end expect
      end # specify
    end # context

    context 'with a number >= 5000' do
      specify 'raises an error' do
        expect {
          5000.romanize
        }.to raise_error(
          RangeError,
          /within range 1 to 4999/
        ) # end expect
      end # specify
    end # context

    expected_values = {
      1 => 'I',
      2 => 'II',
      3 => 'III',
      4 => 'IV',
      5 => 'V',
      6 => 'VI',
      7 => 'VII',
      8 => 'VIII',
      9 => 'IX',
      10 => 'X',
      11 => 'XI',
      12 => 'XII',
      13 => 'XIII',
      14 => 'XIV',
      15 => 'XV',
      16 => 'XVI',
      17 => 'XVII',
      18 => 'XVIII',
      19 => 'XIX',
      20 => 'XX',
      30 => 'XXX',
      40 => 'XL',
      49 => 'XLIX',
      50 => 'L',
      60 => 'LX',
      70 => 'LXX',
      80 => 'LXXX',
      90 => 'XC',
      99 => 'XCIX',
      100 => 'C',
      200 => 'CC',
      300 => 'CCC',
      400 => 'CD',
      499 => 'CDXCIX',
      500 => 'D',
      600 => 'DC',
      700 => 'DCC',
      800 => 'DCCC',
      900 => 'CM',
      999 => 'CMXCIX',
      1000 => 'M',
      2000 => 'MM',
      3000 => 'MMM',
      4000 => 'MMMM',
      4999 => 'MMMMCMXCIX'
    } # end expected values

    expected_values.each do |integer, romanization|
      specify "#{integer} => '#{romanization}'" do
        expect(integer.romanize).to be == romanization
      end # specify
    end # each

    context 'with :additive => true' do
      expected_values = {
        1 => 'I',
        2 => 'II',
        3 => 'III',
        4 => 'IIII',
        5 => 'V',
        6 => 'VI',
        7 => 'VII',
        8 => 'VIII',
        9 => 'VIIII',
        10 => 'X',
        14 => 'XIIII',
        19 => 'XVIIII',
        40 => 'XXXX',
        50 => 'L',
        49 => 'XXXXVIIII',
        90 => 'LXXXX',
        99 => 'LXXXXVIIII',
        100 => 'C',
        400 => 'CCCC',
        499 => 'CCCCLXXXXVIIII',
        500 => 'D',
        900 => 'DCCCC',
        999 => 'DCCCCLXXXXVIIII',
        1000 => 'M',
        4000 => 'MMMM',
        4999 => 'MMMMDCCCCLXXXXVIIII'
      } # end expected values

      expected_values.each do |integer, romanization|
        specify "#{integer} => '#{romanization}'" do
          expect(integer.romanize :additive => true).to be == romanization
        end # specify
      end # each
    end # context
  end # describe
end # describe