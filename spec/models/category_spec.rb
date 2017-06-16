require "rails_helper"

describe Category do
  it "can be instantiated" do
    expect(Category.new).to be_a Category
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:category)).to be_persisted
  end
end
