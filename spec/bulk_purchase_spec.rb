require 'spec_helper'
require 'bulk_purchase'
require 'black_chocolate'

RSpec.describe BulkPurchase do

  before :each do
    @rule = BulkPurchase.new
    @rule.register_product 'CN'
  end

  it "products comply with the rule" do
    products = [BlackChocolate.new, BlackChocolate.new, BlackChocolate.new]
    expect(@rule.is_true_for? products).to eq true
  end

  it "products do not comply with the rule" do
    products = [BlackChocolate.new, BlackChocolate.new]
    expect(@rule.is_true_for? products).to eq false
  end

end