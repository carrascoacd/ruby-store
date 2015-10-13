class PricingRule

  def initialize(code)
    @code = code
  end

  def is_true_for?(products)
    raise NotImplementedError
  end

  def valid_products(products)
    valid_products = []
    products.each do |p|
      valid_products << p if p.code == @code
    end 
    valid_products
  end

end