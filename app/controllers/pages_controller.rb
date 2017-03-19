class PagesController < ApplicationController

    include CurrentCart

    before_action :set_cart, only: [:index]

    def index
        @products = Product.all
    end

    def about
    end

    def contact
    end
end
