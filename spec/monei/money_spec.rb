RSpec.describe Monei::Money do
  describe '#amount' do
    it 'returns the amount' do
      money = described_class.new(50, 'EUR')

      expect(money.amount).to eq 50
    end
  end

  describe '#currency' do
    it 'returns the currency' do
      money = described_class.new(50, 'EUR')

      expect(money.currency).to eq 'EUR'
    end
  end

  describe '#inspect' do
    it 'returns a string representation with amount followed by currency' do
      money = described_class.new(50, 'EUR')

      expect(money.inspect).to eq '50.00 EUR'
    end
  end

  describe '#convert_to' do
    context 'with the same currency' do
      it 'keeps the amount unchanged' do
        money = described_class.new(50, 'EUR')

        converted_money = money.convert_to('EUR')

        expect(converted_money.amount).to eq money.amount
      end

      it 'keeps the same currency' do
        money = described_class.new(50, 'EUR')

        converted_money = money.convert_to('EUR')

        expect(converted_money.currency).to eq money.currency
      end
    end

    context 'with different currency' do
      it 'converts the amount'

      it 'changes the currency' do
        money = described_class.new(50, 'EUR')

        converted_money = money.convert_to('USD')

        expect(converted_money.currency).to eq 'USD'
      end
    end
  end

  describe '#==' do
    context 'when other has the same value and currency' do
      it 'evalutes to true' do
        money1 = described_class.new(50, 'EUR')
        money2 = described_class.new(50, 'EUR')

        expect(money1).to eq money2
      end
    end

    context 'when other the same value and different currency' do
      it 'evalutes to false' do
        money1 = described_class.new(50, 'EUR')
        money2 = described_class.new(50, 'USD')

        expect(money1).not_to eq money2
      end
    end

    context 'when values and currencies are both different' do
      it 'evalutes to false' do
        money1 = described_class.new(150, 'EUR')
        money2 = described_class.new(250, 'USD')

        expect(money1).not_to eq money2
      end
    end

    context 'when given anything else' do
      it 'raises type error' do
        money1 = described_class.new(50, 'USD')

        expect{ money1 == :anything_else }.to raise_error TypeError
      end
    end
  end
end
