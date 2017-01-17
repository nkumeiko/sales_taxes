class LineItem
  attr_accessor :quantity, :product, :price

  def initialize(row)
    @quantity = BigDecimal.new(row['Quantity'])
    @product = row['Product']
    @price = BigDecimal.new(row['Price'])
  end

  def total_price_with_taxes
    (quantity * price + taxes).round(2)
  end

  def taxes
    quantity * tax_calculator.tax_for(price)
  end

  private

  def tax_calculator
    TaxCalculator.new(product)
  end
end
