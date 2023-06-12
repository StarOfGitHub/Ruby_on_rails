########################
# Course - JavaScript
########################
course = @path.add_course do |course|
  course.title = 'JavaScript'
  course.description = "Make your websites dynamic and interactive with JavaScript! You'll create features and stand-alone applications. This module includes projects where you will learn how to manipulate the DOM, use object-oriented programming principles, and build single page applications with React."
  course.identifier_uuid = 'c2370a3b-d75a-4307-99fa-91a9a74b8621'
  course.show_on_homepage = true
  course.badge_uri = 'badge-javascript.svg'
end

# ++++++++++++++++++++++
# SECTION - Introduction
# ++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Introduction'
  section.description = 'Welcome to the JavaScript course! Start here!'
  section.identifier_uuid = '1c6cdfd9-cda0-4791-a290-87b270e9d19f'

  section.add_lessons(
    javascript_lessons.fetch('How this course will work'),
    javascript_lessons.fetch('A quick review'),
  )
end

# +++++++++++++++++++++++++++++++++++++++++
# SECTION - Organizing your JavaScript Code
# +++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Organizing your JavaScript Code'
  section.description = 'This series digs in to the things you need to write larger and larger applications with JavaScript. This is where it gets real!'
  section.identifier_uuid = '8b5f0c45-60f5-4dd9-8491-86d5d98f4ed3'

  section.add_lessons(
    javascript_lessons.fetch('Organizing your JavaScript Code Introduction'),
    javascript_lessons.fetch('Objects and Object Constructors'),
    javascript_lessons.fetch('Library'),
    javascript_lessons.fetch('Factory Functions and the Module Pattern'),
    javascript_lessons.fetch('Tic Tac Toe'),
    javascript_lessons.fetch('Classes'),
    javascript_lessons.fetch('ES6 Modules'),
    javascript_lessons.fetch('Webpack'),
    javascript_lessons.fetch('Restaurant Page'),
    javascript_lessons.fetch('OOP Principles'),
    javascript_lessons.fetch('Todo List'),
  )
end

# ++++++++++++++++++++++++++++++++++++++
# SECTION - JavaScript in the Real World
# ++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'JavaScript in the Real World'
  section.description = "Let's look at a few more practical applications of JavaScript and learn about a few useful tools that are widely used in the industry."
  section.identifier_uuid = '13dd6461-9562-4715-acad-32c9ea518c4a'

  section.add_lessons(
    javascript_lessons.fetch('Linting'),
    javascript_lessons.fetch('Dynamic User Interface Interactions'),
    javascript_lessons.fetch('Form Validation with JavaScript'),
    javascript_lessons.fetch('What is ES6?'),
  )
end

# ++++++++++++++++++++++++++++++++++++++++++
# SECTION - Asynchronous JavaScript and APIs
# ++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Asynchronous JavaScript and APIs'
  section.description = 'This section explores asynchronous JavaScript and event loops, and how it\'s useful in fetching data from web servers using APIs.'
  section.identifier_uuid = '46153ba3-d10b-4566-924f-b3fa549a05bc'

  section.add_lessons(
    javascript_lessons.fetch('JSON'),
    javascript_lessons.fetch('Asynchronous Code'),
    javascript_lessons.fetch('Working with APIs'),
    javascript_lessons.fetch('Async and Await'),
    javascript_lessons.fetch('Weather App'),
  )
end

# ++++++++++++++++++++++++++++++++++++++++++
# SECTION - A Bit of Computer Science
# ++++++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'A Bit of Computer Science'
  section.description = "In this section, you'll learn some fundamental computer science concepts that will help you when solving problems with a bit more complexity than just simple web serving.  You get to try on your engineering hat and solve some pretty nifty problems."
  section.identifier_uuid = 'e470decc-864a-479f-917c-d999c131aa79'

  section.add_lessons(
    javascript_lessons.fetch('A Very Brief Intro to CS'),
    javascript_lessons.fetch('Recursive Methods'),
    javascript_lessons.fetch('Recursion'),
    javascript_lessons.fetch('Time Complexity'),
    javascript_lessons.fetch('Space Complexity'),
    javascript_lessons.fetch('Common Data Structures and Algorithms'),
    javascript_lessons.fetch('Linked Lists'),
    javascript_lessons.fetch('Binary Search Trees'),
    javascript_lessons.fetch('Knights Travails'),
  )
end

# ++++++++++++++++++++++++++++
# SECTION - Testing JavaScript
# ++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Testing JavaScript'
  section.description = "Test driven development is an important skill in today's dev world. This section digs into the details of writing automated JavaScript tests."
  section.identifier_uuid = 'def99a36-0705-4b03-8aee-0aa0ae2b447c'

  section.add_lessons(
    javascript_lessons.fetch('Testing Basics'),
    javascript_lessons.fetch('Testing Practice'),
    javascript_lessons.fetch('More Testing'),
    javascript_lessons.fetch('Battleship'),
  )
end

# +++++++++++++
# SECTION - Intermediate Git
# +++++++++++++
course.add_section do |section|
  section.title = 'Intermediate Git'
  section.description = "You should be familiar with the basic Git workflow since you've been using it to save your projects along the way (right?!). This section will start preparing you for the more intermediate-level uses of Git that you'll find yourself doing."
  section.identifier_uuid = '90e786c3-fe63-427f-82be-067810318b19'

  section.add_lessons(
    git_lessons.fetch('A Deeper Look at Git'),
    git_lessons.fetch('Using Git in the Real World'),
  )
end

# ++++++++++++++++++
# SECTION - React JS
# ++++++++++++++++++
course.add_section do |section|
  section.title = 'React JS'
  section.description = 'In this section you will learn the basics of the most popular frontend framework, React JS.'
  section.identifier_uuid = 'cc1904b4-98d7-41a9-8ef1-a22200be9d63'

  section.add_lessons(
    react_lessons.fetch('React Introduction'),
    react_lessons.fetch('State and Props'),
    react_lessons.fetch('Handle Inputs and Render Lists'),
    react_lessons.fetch('CV Application'),
    react_lessons.fetch('Lifecycle Methods'),
    react_lessons.fetch('Hooks'),
    react_lessons.fetch('Memory Card'),
    react_lessons.fetch('Router'),
    react_lessons.fetch('React Testing Part 1'),
    react_lessons.fetch('React Testing Part 2'),
    react_lessons.fetch('Shopping Cart'),
    react_lessons.fetch('Advanced Concepts'),
  )
end

# ++++++++++++++++++++++++++++++++++++
# SECTION - JavaScript and the Backend
# ++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'JavaScript and the Backend'
  section.description = "A real web app needs a back end in order to persist its data and do sensitive operations. Here you'll learn how to outsource your backend to a Backend-as-a-Service company like Firebase."
  section.identifier_uuid = 'f9b2f981-7f7e-4058-9053-03fe199cc06c'

  section.add_lessons(
    javascript_lessons.fetch('Using BaaS For Your Back End'),
    javascript_lessons.fetch("Where's Waldo (A Photo Tagging App)"),
  )
end

# ++++++++++++++++++++++++++++++++++++++
# SECTION - Finishing Up with JavaScript
# ++++++++++++++++++++++++++++++++++++++
course.add_section do |section|
  section.title = 'Finishing Up with JavaScript'
  section.description = "You've learned everything you need and all that remains to do is apply that knowledge to a worthy task. In this section you will be working on your capstone project so you can show off your range of skills."
  section.identifier_uuid = 'b0761d75-2a9a-4c33-b02a-1d072b75889f'

  section.add_lessons(
    javascript_lessons.fetch('JavaScript Final Project'),
    javascript_lessons.fetch('Conclusion'),
  )
end

# clean up any removed seeds from the database
course.delete_removed_seeds
