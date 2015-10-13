require 'spec_helper'
require 'discounts/one_free'
require 'products/black_chocolate'

RSpec.describe BlackChocolate do

  before :each do
    @discount = OneFree.new
  end

  it "returns the right discount" do
    products = [BlackChocolate.new, BlackChocolate.new]
    expect(@discount.in products).to eq products.first.price
  end

  it "returns the right discount" do
    products = [BlackChocolate.new]
    expect(@discount.in products).to eq 0
  end

  it "returns the right discount" do
    products = []
    (1..5).each do |i|
      products << BlackChocolate.new
    end
    expect(@discount.in products).to eq products.first.price * 2
  end

  it "returns the right discount" do
    products = []
    expect(@discount.in products).to eq 0
  end

end