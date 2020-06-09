# frozen_string_literal: true

describe Facts::Macosx::Networking::Primary do
  describe '#call_the_resolver' do
    subject(:fact) { Facts::Macosx::Networking::Primary.new }

    let(:value) { 'en0' }

    before do
      allow(Facter::Resolvers::Macosx::Ipaddress).to receive(:resolve).with(:primary).and_return(value)
    end

    it 'calls Facter::Resolvers::Macosx::Ipaddress' do
      fact.call_the_resolver
      expect(Facter::Resolvers::Macosx::Ipaddress).to have_received(:resolve).with(:primary)
    end

    it 'returns networking.primary fact' do
      expect(fact.call_the_resolver)
        .to be_an_instance_of(Facter::ResolvedFact).and have_attributes(name: 'networking.primary', value: value)
    end
  end
end
