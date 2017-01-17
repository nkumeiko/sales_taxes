class TaxCalculator
  IMPORTED = BigDecimal.new('0.05')
  REGULAR = BigDecimal.new('0.1')

  def initialize(product)
    @product = product.downcase
  end

  def tax_for(price)
    value = BigDecimal.new('0')

    if imported?
      value += price * IMPORTED
    end

    unless book? || food? || medical_product?
      value += price * REGULAR
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
