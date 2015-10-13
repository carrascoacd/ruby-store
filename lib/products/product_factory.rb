require 'products/black_chocolate'
require 'products/tine_wine'
require 'products/potatoe'

class ProductFactory

  def self.build_product_for(code)
    case code
      when 'CN'
        BlackChocolate.new
      when 'PT'
        Potatoe.new
      when 'VT'
        TineWine.new
      else
        nil
    end
  end

end