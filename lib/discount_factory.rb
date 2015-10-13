require 'two_for_one'
require 'bulk_purchase'
require 'low_price'
require 'one_free'

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