class Product < ApplicationRecord
  belongs_to :order
  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end
end
