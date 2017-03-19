class Product < ApplicationRecord

    # Filters
    before_destroy :ensure_not_referenced_by_a_line_item

    # Associations
    belongs_to :category
    has_many :line_items
    has_many :orders, through: :line_items

    # Validations
    validates :title, :description, :image_file, presence: true
    validates :title, uniqueness: true
    validates :price, numericality: { greater_than_or_equal_to: 0.51 }
    validates :image_file, allow_blank: true, format: {
        with:    %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
    }

    has_attached_file :image_file, :styles => { :medium => "400x400#", :thumb => "200x200#" }
    validates_attachment :image_file, :presence => true, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :less_than => 4.megabyte }

    # Enumerators
    enum gender: { neutral: 0 , mens: 1, womens: 2, kids: 3 }

    private

    def ensure_not_referenced_by_a_line_item
        unless line_items.empty?
            errors.add(:base, 'Line items present.')
            throw :abort
        end
    end
end
