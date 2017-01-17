class CsvIO
  def self.read(filename)
    CSV.new(File.open(filename), headers: true).to_a.map(&:to_hash)
  end

  def self.write(basket, io = STDOUT)
    basket.line_items.each do |line_item|
      io.puts "#{line_item.quantity.to_i}, "\
              "#{line_item.product}, "\
              "#{'%.02f' % line_item.total_price_with_taxes}"
    end

    io.puts "Sales Taxes: #{'%.02f' % basket.sales_taxes}"
    io.puts "Total: #{'%.02f' % basket.total}"
  end
end
