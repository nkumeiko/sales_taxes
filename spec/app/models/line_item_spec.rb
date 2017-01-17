require 'spec_helper'

RSpec.describe LineItem do
  let(:row) { { 'Quantity' => '2', 'Product' => 'imported chocolate', 'Price' => '2.99' } }

  subject { described_class.new(row) }

  describe '#quantity' do
    it 'returns BigDecimal' do
      expect(subject.quantity).to be_a(BigDecimal)
    end

    it 'returns value [2]' do
      expect(subject.quantity).to eq(BigDecimal.new('2'))
    end
  end

  describe '#product' do
    it 'returns String' do
      expect(subject.product).to be_a(String)
    end

    it 'returns value [imported chocolate]' do
      expect(subject.product).to eq('imported chocolate')
    end
  end

  describe '#price' do
    it 'returns BigDecimal' do
      expect(subject.price).to be_a(BigDecimal)
    end

    it 'returns value [2.99]' do
      expect(subject.price).to eq(BigDecimal.new('2.99'))
    end
  end

  describe '#taxes' do
    it 'returns total taxes multiplied on quantity' do
      expect(subject.taxes).to eq(BigDecimal.new('0.3'))
    end
  end

  describe '#total_price_with_taxes' do
    it 'returns total price including taxes rounded to the hundredths' do
      expect(subject.total_price_with_taxes).to eq(BigDecimal.new('6.28'))
    end
  end
end
