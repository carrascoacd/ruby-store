require 'black_chocolate'
require 'tine_wine'
require 'potatoe'

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