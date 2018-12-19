require 'rails_helper'

describe Comment do
    context "when the product has comments" do
        let(:user){ User.create!(email: "test@gmail.com", password: "testtest") }
        let(:product){ Product.create!(name: "tester bike")}

        before do
            Product.comments.create!(body: "the bikes are getting smarter, soon they will take over. You have been warned.")

        it "not valid without a body"
          expect(Comment.new(rating: 5, user: user)).not_to be_valid
        end

    end
end
