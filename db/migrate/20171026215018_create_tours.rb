class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.date :date, null: false
      t.integer :vacancies, null: false
      t.time :arrival_time, null: false
      t.time :departure_time, null: false
      t.references :route, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
