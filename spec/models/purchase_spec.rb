require 'spec_helper'

describe Purchase do
  it "validates" do
    purchase = Purchase.new item_price: "a"
    expect( purchase ).to be_invalid
  end
end
