class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :name, null: false, unique: true
      t.decimal :price, precision: 12, scale: 2, null: false
    end
  end
end
