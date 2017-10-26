class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :name, :unique
      t.decimal :price, precision: 12, scale: 2, null: false

      t.timestamps
    end
  end
end
