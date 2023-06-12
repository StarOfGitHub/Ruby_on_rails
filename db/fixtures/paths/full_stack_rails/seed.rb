# ***************************
# Path - Full Stack Rails
# ***************************
@path = Seeds::PathBuilder.build do |path|
  path.title = 'Full Stack Ruby on Rails'
  path.short_title = 'Rails Path'
  path.description = "This path takes you through our entire Ruby on Rails curriculum. The courses should be taken in the order that they are displayed. You'll learn everything you need to know to create beautiful responsive websites from scratch using Ruby on Rails."
  path.badge_uri = 'badge-ruby-on-rails.svg'
  path.identifier_uuid = '16109529-1526-4800-be11-0f655bcfb4cc'
  path.position = 2
end

load './db/fixtures/paths/full_stack_rails/courses/ruby.rb'
load './db/fixtures/paths/full_stack_rails/courses/intermediate_html_css.rb'
load './db/fixtures/paths/full_stack_rails/courses/databases.rb'
load './db/fixtures/paths/full_stack_rails/courses/rails.rb'
load './db/fixtures/paths/full_stack_rails/courses/advanced_html_css.rb'
load './db/fixtures/paths/full_stack_rails/courses/javascript.rb'
load './db/fixtures/paths/full_stack_rails/courses/getting_hired.rb'

# create path prerequisites
@path.path.path_prerequisites.find_or_create_by!(prerequisite_id: Path.find_by(title: 'Foundations').id)

# clean up any removed courses
@path.delete_removed_courses
