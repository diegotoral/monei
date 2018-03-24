RSpec.describe Monei do
  it "has a version number" do
    expect(Monei::VERSION).not_to be nil
  end

  it 'has a precision number of 4' do
    expect(Monei.precision).to eq 4
  end

  it 'allows set a different precision when needed' do
    Monei.precision = 64

    expect(Monei.precision).to eq 64
  end

  describe '#Amount' do
    context 'when given a number' do
      it 'returns an Amount with value correctly set' do
        amount = Monei::Amount(50)

        expect(amount.value).to eq 50
      end
    end

    context 'when given an Amount instance' do
      it 'returns the instance itself' do
        unconverted_amount = double(:amount)
        allow(unconverted_amount).to receive(:is_a?).with(Monei::Amount).and_return(true)

        amount = Monei::Amount(unconverted_amount)

        expect(amount).to eq unconverted_amount
      end
    end
  end

  describe '#Currency' do
    context 'when given a string' do
      it 'returns an Currency with the specified currency' do
        currency = Monei::Currency('usd')

        expect(currency.id).to eq 'USD'
      end
    end

    context 'when given a Currency instance' do
      it 'returns the instance itself' do
        unconverted_currency = double(:currency)
        allow(unconverted_currency).to receive(:is_a?).with(Monei::Currency).and_return(true)

        currency = Monei::Currency(unconverted_currency)

        expect(currency).to eq unconverted_currency
      end
    end
  end
end
