class Basket
  def initialize(data)
    @data = data
  end

  def sales_taxes
    line_items.reduce(BigDecimal.new(0)) do |sum, line_item|
      sum + line_item.taxes
    end
  end

  def total
    line_items.reduce(BigDecimal.new(0)) do |sum, line_item|
      sum + line_item.total_price_with_taxes
    end
  end

  def line_items
    @line_items ||= data.map { |row| LineItem.new(row) }
  end

  private

  attr_accessor :data
end
