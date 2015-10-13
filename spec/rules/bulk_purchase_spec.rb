require 'spec_helper'
require 'rules/bulk_purchase'
require 'products/black_chocolate'

RSpec.describe BulkPurchase do

  before :each do
    @rule = BulkPurchase.new 'CN'
  end

  it "products comply with the rule" do
    products = []
    (1..3).each do |i|
      products << BlackChocolate.new
    end
    expect(@rule.is_true_for? products).to eq true
  end

  it "products do not comply with the rule" do
    products = []
    (1..2).each do |i|
      products << BlackChocolate.new
    end
    expect(@rule.is_true_for? products).to eq false
  end

end