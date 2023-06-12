# rubocop: disable Style/ClassVars
require './lib/seeds/lesson_builder'

module Seeds
  class SectionBuilder
    @@total_seeded_lessons = Hash.new(0)

    attr_accessor :identifier_uuid, :title, :description, :position
    attr_reader :seeded_lessons

    def initialize(course, position)
      @course = course
      @position = position
      @seeded_lessons = []

      yield self
      @section = section
    end

    def self.build(course, position, &)
      new(course, position, &)
    end

    def section
      @section ||= course.sections.seed(:identifier_uuid) do |section|
        section.identifier_uuid = identifier_uuid
        section.title = title
        section.description = description
        section.position = position
      end.first
    end

    def add_lessons(*lessons)
      @add_lessons ||= lessons.map do |lesson|
        LessonBuilder.build(section, lesson_position, lesson).tap do |seeded_lesson|
          seeded_lessons.push(seeded_lesson)
        end
      end
    end

    private

    attr_reader :course

    def lesson_position
      @@total_seeded_lessons[section.course.identifier_uuid] += 1
    end
  end
end
# rubocop: enable Style/ClassVars
