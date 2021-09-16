class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.date :payment_date
      t.string :description
      t.references :payment_term, null: false, foreign_key: true
      t.string :client_name
      t.string :client_email
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
