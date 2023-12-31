class Course::BadgeComponent < ApplicationComponent
  delegate :user_signed_in?, to: :helpers

  def initialize(course:, options: {})
    @course = course
    @options = options
  end

  private

  attr_reader :course, :options

  def badge
    @course.badge_uri || fallback_icon
  end

  def badge_path
    badge_uri = @course.badge_uri.split('.').first

    "badges/#{badge_uri}-borderless.svg"
  end

  def fallback_icon
    'icons/odin-icon.svg'
  end

  def size
    options[:size] || :default
  end

  def option_params
    {
      background_color: options[:background_color],
      size:,
      show_icon: options[:show_badge],
      badge_path:,
    }.compact
  end
end
