class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :distance
      t.date :date

      t.timestamps
    end
  end
end
