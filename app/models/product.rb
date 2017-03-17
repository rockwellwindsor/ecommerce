class Product < ApplicationRecord

    # Validations
    validates :title, :description, :image_file, presence: true
    validates :title, uniqueness: true
    validates :price, numericality: { greater_than_or_equal_to: 0.51 }
    validates :image_file, allow_blank: true, format: { 
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for gif, jpg or png image.'
    }

    has_attached_file :image_file, :styles => { :medium => "400x400#", :thumb => "200x200#" }
    validates_attachment :image_file, :presence => true, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :less_than => 4.megabyte }

    # Enumerators
    enum gender: { neutral: 0 , mens: 1, womens: 2, kids: 3 }
end
