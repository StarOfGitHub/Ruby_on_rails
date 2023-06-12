class User < ApplicationRecord
  acts_as_voter
  before_create :enroll_in_foundations

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[github google]

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, length: { in: 2..100 }
  validates :learning_goal, length: { maximum: 1700 }

  has_many :lesson_completions, dependent: :destroy
  has_many :completed_lessons, through: :lesson_completions, source: :lesson
  has_many :project_submissions, dependent: :destroy
  has_many :user_providers, dependent: :destroy
  has_many :flags, foreign_key: :flagger_id, dependent: :destroy, inverse_of: :flagger
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :announcements, dependent: nil
  belongs_to :path, optional: true

  def progress_for(course)
    @progress ||= Hash.new { |hash, c| hash[c] = CourseProgress.new(c, self) }
    @progress[course]
  end

  def completed?(lesson)
    completed_lessons.pluck(:id).include?(lesson.id)
  end

  def latest_completed_lesson
    return if last_lesson_completed.nil?

    Lesson.find(last_lesson_completed.lesson_id)
  end

  def lesson_completions_for_course(course)
    lesson_completions.where(course_id: course.id)
  end

  def active_for_authentication?
    super && !banned?
  end

  def inactive_message
    banned? ? :banned : super
  end

  def dismissed_flags
    flags.where(taken_action: :dismiss)
  end

  def started_course?(course)
    lesson_completions.exists?(course_id: course.id)
  end

  def on_path?(path)
    self.path == path
  end

  private

  def last_lesson_completed
    lesson_completions.order(created_at: :asc).last
  end

  def enroll_in_foundations
    default_path = Path.default_path

    self.path_id = default_path.id if default_path.present?
  end
end
