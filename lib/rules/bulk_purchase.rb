require 'rules/pricing_rule'

class BulkPurchase < PricingRule

  def is_true_for?(products)
    valid_products(products).size >= 3
  end

end