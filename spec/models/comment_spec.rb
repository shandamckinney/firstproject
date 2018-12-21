require 'rails_helper'

describe Comment do
	it "is not valid without a rating" do
		expect(Comment.new(rating: 1)).not_to be_valid
	end
end
