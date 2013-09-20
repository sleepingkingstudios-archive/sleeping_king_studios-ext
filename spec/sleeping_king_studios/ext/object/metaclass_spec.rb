# spec/sleeping_king_studios/ext/object/metaclass_spec.rb

require 'sleeping_king_studios/ext/spec_helper'

require 'sleeping_king_studios/ext/object/metaclass'

describe Object do
  let(:instance) { described_class.new }

  describe '#metaclass' do
    let(:instance_metaclass) do
      class << instance; self; end
    end # let

    specify 'responds to' do
      expect(instance).to respond_to(:metaclass).with(0).arguments
    end # specify

    specify 'returns the metaclass' do
      expect(instance.metaclass).to be(instance_metaclass)
    end # specify
  end # describe
end # describe
