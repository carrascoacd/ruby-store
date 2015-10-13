require 'discount_factory'
require 'product_factory'

class Checkout

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @products = []
  end

  def scan(code)
    product = ProductFactory.build_product_for code
    @products << product
  end

  def total
    total_price = 0
    total_discount = 0
    @pricing_rules.each do |rule|
      if rule.is_true_for? @products
        discount = DiscountFactory.build_discount_for rule
        products_to_apply_discount = rule.valid_products @products
        total_discount += discount.in products_to_apply_discount
      end
    end
    @products.each do |p|
      total_price += p.price
    end
    total_price - total_discount
  end

end