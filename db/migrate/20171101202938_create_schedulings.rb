class CreateSchedulings < ActiveRecord::Migration[5.1]
  def change
    create_table :schedulings do |t|
      t.decimal :total_price, precision: 12, scale: 2, null: false
      t.decimal :receive_price, precision: 12, scale: 2
      t.decimal :voucher_price, precision: 12, scale: 2
      
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
