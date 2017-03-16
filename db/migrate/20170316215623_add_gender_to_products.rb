class AddGenderToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :gender, :integer
  end
end
