class AddAttributestoUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :qualification, :string
    add_column :users, :comission, :decimal, precision: 12, scale: 2
  end
end
