class Cart < ApplicationRecord

    # Associations
    has_many :line_items, dependent: :destroy

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
            current_item.quantity += 1
        else
            current_item = line_items.build(product_id: product.id)
        end
        current_item
    end

    def total_price
        # Turn it into and array and sum the array
        line_items.to_a.sum { | item | item.total_price }
    end

    def is_empty?(cart)
        cart.line_items.count > 0 ? false : true
    end

end