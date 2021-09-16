class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :name
      t.integer :quantity, null: false, default: 0
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
