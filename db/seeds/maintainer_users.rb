if Rails.env.development? || ENV['STAGING']
  names = %w[kevin rachel austin sully tatiana briggs leo grace]

  names.each do |name|
    User.find_or_create_by!(email: "#{name}@odin.com") do |user|
      user.username = name
      user.password = 'password'
      user.admin = true
    end
  end
end
