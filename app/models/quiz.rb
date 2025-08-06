class Quiz < ApplicationRecord
  include Statusable

  has_many :quiz_questions, -> { where(active: true) }, dependent: :destroy
  has_many :people, through: :quiz_questions

  validates :title, presence: true
end
