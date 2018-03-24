module Monei
  class Money
    def initialize(amount, currency)
      @amount = Monei::Amount(amount)
      @currency = Monei::Currency(currency)
    end

    def amount
      @amount.value
    end

    def currency
      @currency.id
    end

    def inspect
      "#{@amount.inspect} #{@currency.inspect}"
    end

    def convert_to(final_currency)
      self.class.new(amount, final_currency)
    end

    def ==(other)
      if other.is_a? Money
        (amount == other.amount) && (currency == other.currency)
      else
        raise TypeError
      end
    end
  end
end
