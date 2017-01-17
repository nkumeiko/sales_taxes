require 'spec_helper'

RSpec.describe CsvIO do
  let(:data) do
    [
      { 'Quantity' => '1', 'Product' => 'book', 'Price' => '12.49' },
      { 'Quantity' => '1', 'Product' => 'music cd', 'Price' => '14.99' },
      { 'Quantity' => '1', 'Product' => 'chocolate bar', 'Price' => '0.85' }
    ]
  end

  let(:output) do
    "1, book, 12.49\n" \
    "1, music cd, 16.49\n" \
    "1, chocolate bar, 0.85\n" \
    "Sales Taxes: 1.50\n" \
    "Total: 29.83\n"
  end

  describe '.read' do
    it 'returns array of hashes from input csv file' do
      filepath = File.join(ROOT_PATH, 'spec/assets/input1.csv')
      expect(described_class.read(filepath)).to eq(data)
    end
  end

  describe '.write' do
    let(:io) { StringIO.new }

    it 'checkout to the output' do
      described_class.write(Basket.new(data), io)
      expect(io.string).to eq(output)
    end
  end
end
