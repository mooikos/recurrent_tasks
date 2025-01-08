module RecurrentTasks
  class TimeFrequencyParser
    def parse_frequency(frequency)
      raise ArgumentError, 'Invalid frequency format' unless frequency.match(/(\d+)\s+(\w+)/)

      amount = ::Regexp.last_match(1).to_i
      unit = ::Regexp.last_match(2).downcase

      get_seconds(unit, amount)
    end

    private

    def get_seconds(unit, amount)
      case unit
      when 'day', 'days' then amount * 86_400
      when 'week', 'weeks' then amount * 604_800
      when 'month', 'months' then amount * 2_628_000 # Approximate average (30.44 days)
      when 'year', 'years' then amount * 31_536_000
      else
        raise ArgumentError, "Unknown time unit: #{unit}"
      end
    end
  end
end
