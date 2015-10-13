require 'pricing_rule'

class TwoForOne < PricingRule

  def is_true_for?(products)
    valid_products(products).size >= 2
  end

end