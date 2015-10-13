require 'discount'

class LowPrice < Discount

  def in(products)
    product_count = products.size
    if product_count > 0
      if product_count >= 3 and product_count < 6
        products.size * 0.5
      elsif product_count >= 6
        products.size * 2
      else 
        0
      end
    else
      super
    end
  end

end