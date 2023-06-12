class LessonCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :course, optional: true
  belongs_to :path, optional: true

  validates :user_id, uniqueness: { scope: :lesson_id }

  scope :created_today, -> { where('created_at >= ?', Time.zone.now.beginning_of_day) }
end
