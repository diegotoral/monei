module Monei
  class Amount
    attr_reader :value

    def initialize(value, precision=Monei.precision)
      @value = BigDecimal.new(value, precision)
    end

    def inspect
      "%00.2f" % value
    end
  end
end
