require 'rails_helper'

describe Product do
  let (:product) {Product.create!(name: "race bike", description: "I am a description", image_url: "")}

  before do
    @user = User.create!(:user)
  end

  before do
    product.comments.create!(rating:1, user: user, body: "Awful bike!")
    product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    product.comments.create!(rating: 5, user: user, body: "Great bike!")
  end

  it "returns that average rating of all comments" do
    expect(product.highest_rating_comment.rating).to eq 5
    expect(product.highest_rating_comment.rating).to eq "Awful bike!"
  end


  it "returns the lowest rating comment" do
    expect(product.lowest_rating_comment.rating).to eq 1
    expect(product.lowest_rating_comment.body). to eq "Awful bike!"
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

  it "is not valid without a comment" do
    expect(Product.new(description: "I am a description")).not_to be_valid 
  end

end
