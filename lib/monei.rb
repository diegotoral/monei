require 'bigdecimal'

require "monei/version"
require "monei/amount"
require "monei/currency"
require "monei/money"

module Monei
  class << self
    attr_accessor :precision

    # Converts a +value+ to an Amount.
    def Amount(value)
      return value if value.is_a? Amount
      Amount.new(value)
    end

    # Converts +currency+ to a Currency.
    def Currency(currency)
      return currency if currency.is_a? Currency
      Currency.new(currency)
    end
  end

  # Precision used when converting amounts to BigDecimal.
  self.precision = 4
end
