module Monei
  class Currency
    attr_reader :id

    def initialize(id)
      @id = id.to_s.upcase
    end

    def inspect
      id
    end

    def ==(other)
      if other.is_a? Currency
        id == other.id
      else
        raise TypeError
      end
    end
  end
end
