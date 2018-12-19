require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let (:product) {Product.create!(name: "race bike", description: "I am a description", image_url: "https://i.ibb.co/W5TYCPq/iconfinder-028-Snowman-2792938.png")}
    let (:user) {User.create!(email: "test@gmail.com", password: "password")}

    before do
      product.comments.create!(rating:1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Cool Bike!")).not_to be_valid
    end
  end
end
