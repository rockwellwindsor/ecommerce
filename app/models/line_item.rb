class LineItem < ApplicationRecord

    # Associations
    belongs_to :product, optional: true
    belongs_to :cart
    belongs_to :order, optional: true

    # Returns a total of multiples of items added to a cart.
    def total_price
        product.price * quantity
    end
end
