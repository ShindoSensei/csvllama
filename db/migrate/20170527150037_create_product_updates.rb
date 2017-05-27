class CreateProductUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :product_updates do |t|
      t.belongs_to :product, foreign_key: true
      t.integer :time_stamp
      t.json :object_changes, default: {}
      t.timestamps
    end
  end
end
