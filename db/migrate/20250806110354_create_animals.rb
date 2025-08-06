class CreateAnimals < ActiveRecord::Migration[8.0]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.integer :age
      t.string :color
      t.float :weight
      t.integer :leg_count, default: 4
      t.string :species, null: false
      t.string :kind, null: false # for STI

      t.timestamps
    end
  end
end
