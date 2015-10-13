require 'discount'

class OneFree < Discount

  def in(products)
    if products.size > 0
      products.size/2.to_i * products.first.price
    else
      super
    end
  end

end