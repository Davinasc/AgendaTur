class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :hotel
      t.string :apartment
      t.boolean :adult

      t.timestamps
    end
  end
end
