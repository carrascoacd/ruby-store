require 'rules/two_for_one'
require 'rules/bulk_purchase'
require 'discounts/low_price'
require 'discounts/one_free'

class DiscountFactory

  def self.build_discount_for(rule)
    case rule.class.name
      when TwoForOne.name
        OneFree.new
      when BulkPurchase.name
        LowPrice.new
      else 
        nil
    end
  end

end