RSpec.describe Monei::Amount do
  describe '.new' do
    it 'stores value as a BigDecimal' do
      amount = described_class.new 1_000

      expect(amount.value).to be_a BigDecimal
    end

    context 'when given an integer' do
      it 'stores the specified amount without loss' do
        amount = described_class.new 10_000

        expect(amount.value).to eq 10_000
      end
    end

    context 'when given a float' do
      it 'stores the specified amount without loss' do
        amount = described_class.new 10.5432

        expect(amount.value).to eq BigDecimal.new(10.5432, 4)
      end
    end

    context 'when given a string' do
      it 'stores the specified amount without loss' do
        amount = described_class.new '123.321'

        expect(amount.value).to eq BigDecimal.new('123.321')
      end
    end
  end

  describe '#inspect' do
    it 'rounds amount with precision 2' do
      amount = described_class.new(50.1234)

      expect(amount.inspect).to eq '50.12'
    end
  end
end
