require 'spec_helper'

RSpec.describe Basket do
  let(:data) do
    [
      { 'Quantity' => '1', 'Product' => 'chocolate', 'Price' => '2.99' },
      { 'Quantity' => '2', 'Product' => 'book', 'Price' => '1.99' }
    ]
  end

  subject { described_class.new(data) }

  describe '#line_items' do
    it 'returns correct number of line items' do
      expect(subject.line_items.size).to eq(data.size)
    end

    it 'wraps rows into LineItem' do
      subject.line_items.each do |line_item|
        expect(line_item).to be_a(LineItem)
      end
    end
  end

  describe '#sales_taxes' do
    context 'when exact as proximity' do
      let(:data) { [{ 'Quantity' => '1', 'Product' => 'unknown', 'Price' => '0.5' }] }

      it 'rounds to 0.05' do
        expect(subject.sales_taxes).to eq(BigDecimal.new('0.05'))
      end
    end

    context 'when must be rounded up to closest 0.05' do
      let(:data) { [{ 'Quantity' => '1', 'Product' => 'unknown', 'Price' => '0.4' }] }

      it 'rounds to 0.05' do
        expect(subject.sales_taxes).to eq(BigDecimal.new('0.05'))
      end
    end
  end

  describe '#total' do
    it 'returns total for all goods including taxes rounded to the hundredths' do
      expect(subject.total).to eq(BigDecimal.new('6.97'))
    end
  end
end
