class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :title
      t.string :value

      t.timestamps
    end
  end
end
