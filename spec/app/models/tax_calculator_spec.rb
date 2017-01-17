require 'spec_helper'

RSpec.describe TaxCalculator do
  let(:price) { BigDecimal.new('4.99') }
  subject { described_class.new(product) }

  describe '#tax_for' do
    context 'imported goods' do
      let(:product) { 'imported chocolate bar' }
      it 'returns additional 5% tax' do
        expect(subject.tax_for(price)).to eq(BigDecimal.new('0.2495'))
      end
    end

    context 'all goods except books, food, medical products' do
      let(:product) { 'music cd' }
      it 'returns additional 10% tax' do
        expect(subject.tax_for(price)).to eq(BigDecimal.new('0.499'))
      end
    end

    context 'any book products' do
      let(:product) { 'book' }
      it 'returns no tax' do
        expect(subject.tax_for(price)).to eq(BigDecimal.new('0'))
      end
    end

    context 'imported regular products' do
      let(:product) { 'imported music cd' }
      it 'returns 15% tax in total' do
        expect(subject.tax_for(price)).to eq(BigDecimal.new('0.7485'))
      end
    end
  end
end
