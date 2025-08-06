class CreatePeopleQuizQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :people_quiz_questions, id: false do |t|
      t.belongs_to :person
      t.belongs_to :quiz_question
    end
  end
end
