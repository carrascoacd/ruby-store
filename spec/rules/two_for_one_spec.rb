require 'spec_helper'
require 'rules/two_for_one'
require 'products/black_chocolate'
require 'products/tine_wine'

RSpec.describe TwoForOne do

  before :each do
    @rule = TwoForOne.new 'CN'
  end

  it "products do not comply with the rule" do
    products = [BlackChocolate.new]
    expect(@rule.is_true_for? products).to eq false
  end

  it "products comply with the rule" do
    products = []
    (1..2).each do |i|
      products << BlackChocolate.new
    end
    expect(@rule.is_true_for? products).to eq true
  end

  it "products do not comply with the rule" do
    products = []
    (1..2).each do |i|
      products << TineWine.new
    end
    expect(@rule.is_true_for? products).to eq false
  end

end