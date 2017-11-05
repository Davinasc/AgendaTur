class CreateScheduling < ActiveRecord::Migration[5.1]
  def change
    create_table :schedulings do |t|
      t.references :sale, foreign_key: true
      t.references :client, foreign_key: true
    end
  end
end
