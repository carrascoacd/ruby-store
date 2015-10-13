require 'spec_helper'
require 'two_for_one'
require 'black_chocolate'
require 'tine_wine'

RSpec.describe TwoForOne do

  before :each do
    @rule = TwoForOne.new
    @rule.register_product 'CN'
  end

  it "products comply with the rule" do
    products = [BlackChocolate.new, BlackChocolate.new]
    expect(@rule.is_true_for? products).to eq true
  end

  it "products do not comply with the rule" do
    products = [BlackChocolate.new]
    expect(@rule.is_true_for? products).to eq false
  end

  it "products do not comply with the rule" do
    products = [TineWine.new, TineWine.new]
    expect(@rule.is_true_for? products).to eq false
  end

end