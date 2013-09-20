# spec/sleeping_king_studios/ext/array/fold_spec.rb

require 'sleeping_king_studios/ext/spec_helper'

require 'sleeping_king_studios/ext/array/fold'

describe Array do
  let(:instance) { described_class.new }

  describe '#fold' do
    specify 'responds to' do
      expect(instance).to respond_to(:fold)
    end # specify

    specify 'returns a Hash' do
      expect(instance.fold).to be_a Hash
    end # specify

    context 'with countable items' do
      let(:instance) { [1, 1, 1, 2, 2, 3] }

      specify 'returns the number of times each item appears' do
        expect(instance.fold).to be == { 1 => 3, 2 => 2, 3 => 1 }
      end # specify

      context 'with a block' do
        let(:proc) { ->(int) { int ** 2 } }

        specify 'returns the number of times each square appears' do
          expect(instance.fold &proc).to be == { 1 => 3, 4 => 2, 9 => 1 }
        end # specify
      end # context
    end # context
  end # describe
end # describe
