class CreateInvoiceUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_updates do |t|
      t.belongs_to :invoice, foreign_key: true
      t.integer :time_stamp
      t.json :object_changes, default: {}
      t.timestamps
    end
  end
end
