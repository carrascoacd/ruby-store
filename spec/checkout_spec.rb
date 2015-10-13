require 'spec_helper'
require 'checkout'
require 'rules/two_for_one'
require 'rules/bulk_purchase'

RSpec.describe Checkout do

  before :each do
    pricing_rules = [TwoForOne.new('CN'), BulkPurchase.new('PT')]
    @checkout = Checkout.new pricing_rules
  end

  it "returns the correct total" do
    @checkout.scan 'CN'
    @checkout.scan 'PT'
    @checkout.scan 'VT'
    expect(@checkout.total).to eq 19.34
  end

  it "returns the correct total" do
    @checkout.scan 'CN'
    @checkout.scan 'PT'
    @checkout.scan 'CN'
    @checkout.scan 'CN'
    @checkout.scan 'VT'
    expect(@checkout.total).to eq 22.45
  end
  
  it "returns the correct total" do
    @checkout.scan 'CN'
    @checkout.scan 'CN'
    expect(@checkout.total).to eq 3.11
  end

  it "returns the correct total" do
    @checkout.scan 'PT'
    @checkout.scan 'PT'
    @checkout.scan 'VT'
    @checkout.scan 'PT'
    expect(@checkout.total).to eq 24.73
  end

  it "returns the correct total" do
    @checkout.scan 'PT'
    @checkout.scan 'PT'
    @checkout.scan 'PT'
    @checkout.scan 'PT'
    @checkout.scan 'PT'
    @checkout.scan 'PT'
    expect(@checkout.total).to eq 18.00
  end

  it "throws an error when scanning a non valid product" do
    expect{
      @checkout.scan 'my_cat!'
    }.to raise_error(Exceptions::NonValidProductError)
  end

end