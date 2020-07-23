# frozen_string_literal: true

module Facts
  module Aix
    module Memory
      module Swap
        class Used
          FACT_NAME = 'memory.swap.used'

          def call_the_resolver
            fact_value = Facter::Resolvers::Aix::Memory.resolve(:swap)
            if fact_value
              fact_value = Facter::FactsUtils::UnitConverter.bytes_to_human_readable(fact_value[:used_bytes])
            end
            Facter::ResolvedFact.new(FACT_NAME, fact_value)
          end
        end
      end
    end
  end
end
