class LineItem < ApplicationRecord

    # Associations
    belongs_to :product
    belongs_to :cart
end
