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
    round_up(quantity * tax_calculator.tax_for(price))
  end

  private

  def tax_calculator
    TaxCalculator.new(product)
  end

  def round_up(value, proximity = BigDecimal.new('0.05'))
    rest = value % proximity
    result =
      if rest == 0.0
        value
      else
        value + proximity - rest
      end

    result.round(2)
  end
end
