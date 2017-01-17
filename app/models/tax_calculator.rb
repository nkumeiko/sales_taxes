class TaxCalculator
  IMPORTED_GOODS_TAX = BigDecimal.new('0.05')
  REGULAR_GOODS_TAX = BigDecimal.new('0.1')

  def initialize(product)
    @product = product.downcase
  end

  def tax_for(price)
    value = BigDecimal.new('0')

    if imported?
      value += price * IMPORTED_GOODS_TAX
    end

    unless book? || food? || medical_product?
      value += price * REGULAR_GOODS_TAX
    end

    value
  end

  private

  attr_reader :product

  def imported?
    product.include?('imported')
  end

  def book?
    product.include?('book')
  end

  def food?
    product.include?('chocolate')
  end

  def medical_product?
    product.include?('pills')
  end
end
