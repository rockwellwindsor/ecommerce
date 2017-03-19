class LineItem < ApplicationRecord

    # Associations
    belongs_to :product
    belongs_to :cart

    # Returns a total of multiples of items added to a cart.
    def total_price
        product.price * quantity
    end
end
