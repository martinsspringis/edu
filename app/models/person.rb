class Person < ApplicationRecord
  has_many :quizzes, dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :quiz_questions

  validates :first_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name, message: "should be uniq per last_name" }
  validates :last_name, presence: true, if: -> { first_name.blank? }
  validate :full_name_cannot_be_curse_word

  after_commit :after_commit_one
  after_rollback :after_commit_two

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_cannot_be_curse_word
    if full_name.downcase.include?("jods")
      errors.add(:last_name, "last name cannot contain curse words")
    end
  end

  private
  def after_commit_one
    puts "After commit one "
  end

  def after_commit_two
    puts "After rollback two "
  end
end
