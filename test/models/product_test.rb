require 'test_helper'

class ProductTest < ActiveSupport::TestCase

    # fixtures :Products

    test "product attributes must not be empty" do
        product = Product.new
        assert product.invalid?
        assert product.errors[:title].any?
        assert product.errors[:description].any?
        assert product.errors[:image_file_file_name].any?
        assert product.errors[:gender].any?
        assert product.errors[:price].any?
    end

    test "product price must be positive" do
        product = Product.new(
            title: "Sweet new product",
            description: "This is the description",
            image_file_file_name: "2.jpg",
            gender: "neutral"
        )

        product.price = -1
        assert product.invalid?
        assert_equal ["must be greater than or equal to 0.51"], 
        product.errors[:price]
        product.price = 100
        assert product.valid?
    end

    def new_product(image_file_file_name)
        Product.new(
            title: "Sweet old product",
            description: "This is the description",
            image_file_file_name: image_file_file_name,
            gender: "neutral"
        )
    end

    test "image url" do
        ok = %w{ fred.gif fred.jpg fred.png FRED.png FRED.jpg http://a.b.c/x/y/z.gif}
        bad = %w{ fred.doc fred.gif/more fred.gif.more }

        ok.each do | name |
            assert new_product(name).valid?, "#{ name } shouldn't be invalid"
        end

        bad.each do | name |
            assert new_product(name).invalid?, "#{ name } shouldn't be valid"
        end
    end

    test "product is not valid without a unique name" do
        product = Product.new(
            title: products(:one).title,
            description: "And description",
            gender: "neutral",
            image_file_file_name: "17.jpg",
            price: 1
        )
        assert product.invalid?
        assert_equal ["has already been taken"], product.errors[:title]
    end

    test "product is not valid without a unique title" do
        product = Product.new(
            title: products(:one).title,
            description: 'yyy',
            gender: 'mens',
            price: 1,
            image_file_file_name: '1.jpg'
        )
        assert product.invalid?
        assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
    end
end
