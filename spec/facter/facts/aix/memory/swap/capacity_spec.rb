# frozen_string_literal: true

describe Facts::Aix::Memory::Swap::Capacity do
  describe '#call_the_resolver' do
    subject(:fact) { Facts::Aix::Memory::Swap::Capacity.new }

    let(:value) { { available_bytes: 2_332_425, total_bytes: 2_332_999, used_bytes: 1024, capacity: '7,9%' } }
    let(:result) { '7,9%' }

    before do
      allow(Facter::Resolvers::Aix::Memory).to \
        receive(:resolve).with(:swap).and_return(value)
    end

    it 'calls Facter::Resolvers::Aix::Memory' do
      fact.call_the_resolver
      expect(Facter::Resolvers::Aix::Memory).to have_received(:resolve).with(:swap)
    end

    it 'returns swap memory capacity fact' do
      expect(fact.call_the_resolver).to be_an_instance_of(Facter::ResolvedFact).and \
        have_attributes(name: 'memory.swap.capacity', value: result)
    end
  end
end
