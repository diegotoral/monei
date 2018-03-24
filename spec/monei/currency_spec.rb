RSpec.describe Monei::Currency do
  describe '.new' do
    context 'when given a string' do
      it 'upcases the string and saves as the id' do
        currency = described_class.new 'usd'

        expect(currency.id).to eq 'USD'
      end
    end

    context 'when given a symbol' do
      it 'converts into a string and upcases it' do
        currency = described_class.new :usd

        expect(currency.id).to eq 'USD'
      end
    end
  end

  describe '#inspect' do
    it 'returns the currency uppercased' do
      currency = described_class.new 'usd'

      expect(currency.inspect).to eq 'USD'
    end
  end

  describe '#==' do
    context 'when other has the same id or is the same currency' do
      it 'evalutes to true' do
        currency1 = described_class.new 'USD'
        currency2 = described_class.new 'USD'

        expect(currency1).to eq currency2
      end
    end

    context 'when other has different id or is a different currency' do
      it 'evalutes to false' do
        currency1 = described_class.new 'EUR'
        currency2 = described_class.new 'USD'

        expect(currency1).not_to eq currency2
      end
    end

    context 'when given anything else' do
      it 'raises type error' do
        currency = described_class.new 'USD'

        expect{ currency == :anything_else }.to raise_error TypeError
      end
    end
  end
end
