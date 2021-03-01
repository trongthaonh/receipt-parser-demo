class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :image
      t.string :purchase_date
      t.string :phone_number
      t.boolean :purchase_date_is_correct
      t.boolean :phone_number_is_correct
      t.text :raw_content

      t.timestamps
    end
  end
end
