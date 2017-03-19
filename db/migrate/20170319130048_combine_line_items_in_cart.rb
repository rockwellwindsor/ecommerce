class CombineLineItemsInCart < ActiveRecord::Migration[5.0]
    def change

        def up
            # start by iterating over each cart
            Cart.all.each do | cart |
                # for each cart we get a sum of the quantity fields for each line item associated with the cart.
                sums = cart.line_items.group(:product_id).sum(:quantity)

                # iterate over the sums
                sums.each do | product_id, product |
                    # in cases where the quantity is greater than 1 we delete all of the individual line items 
                    # and replace them with a single item and updated quantity for that item
                    if quantity > 1
                        # remove individual items
                        cart.line_items.where(product_id: product_id).delete_all

                        #replace with a single item
                        item = cart.line_items.build(product_id: product_id)
                        item.quantity = quantity
                        item.save!
                    end
                end
            end
        end

        def down
            # split items with quantity > 1 inot multiple items
            LineItem.where("quantity > 1").each do | line_item |
                # add individual items
                line_item.quantity.times do
                    LineItem.create(
                        cart_id: line_item.cart_id,
                        product_id: line_item.product_id,
                        quantity: 1
                    )
                end

                # remove original item
                line_item.destroy
            end
        end
    end
end