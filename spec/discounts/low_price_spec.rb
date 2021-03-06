require 'spec_helper'
require 'discounts/low_price'
require 'products/potatoe'

RSpec.describe LowPrice do

  before :each do
    @discount = LowPrice.new
  end

  it "returns the right discount" do
    products = []
    (1..2).each do |i|
      products << Potatoe.new
    end
    expect(@discount.in products).to eq 0
  end

  it "returns the right discount" do
    products = []
    (1..3).each do |i|
      products << Potatoe.new
    end
    expect(@discount.in products).to eq products.size * 0.5
  end

  it "returns the right discount" do
    products = []
    (1..6).each do |i|
      products << Potatoe.new
    end
    expect(@discount.in products).to eq products.size * 2
  end

  it "returns the right discount" do
    products = []
    (1..9).each do |i|
      products << Potatoe.new
    end
    expect(@discount.in products).to eq products.size * 2
  end

  it "returns the right discount" do
    products = []
    expect(@discount.in products).to eq 0
  end

end