class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name, null: true
      t.timestamps
    end

    add_reference :quizzes, :person, foreign_key: true, null: true
  end
end
