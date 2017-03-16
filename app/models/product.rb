class Product < ApplicationRecord
    has_attached_file :image_file, :styles => { :medium => "400x400#", :thumb => "200x200#" }
    validates_attachment :image_file, :presence => true, :content_type => { :content_type => /\Aimage\/.*\Z/ }, :size => { :less_than => 4.megabyte }

    enum gender: { neutral: 0 , mens: 1, womens: 2, kids: 3 }
end
