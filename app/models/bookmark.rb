class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :movie_id, scope: [:list_id]
end
# example of
# validates_uniqueness_of :teacher_id, scope: [:semester_id, :class_id]
