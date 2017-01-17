require 'spec_helper'

RSpec.describe 'Basket usage' do
  let(:output) do
    "1, book, 12.49\n" \
    "1, music cd, 16.49\n" \
    "1, chocolate bar, 0.85\n" \
    "Sales Taxes: 1.50\n" \
    "Total: 29.83\n"
  end

  describe 'User' do
    let(:io) { StringIO.new }

    before do
      require 'rake'
      load File.join(ROOT_PATH, 'Rakefile')
      stub_const('STDOUT', io)
    end

    it 'generates a receipt' do
      Rake::Task[:receive_receipt]
        .invoke(File.join(ROOT_PATH, 'spec/assets/input1.csv'))
      expect(io.string).to eq(output)
    end
  end
end
