namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts 
   end
 
   def make_users
    99.times do |n|
      email = "example-#{n+1}@railstutorial.org"
      name = Faker::Name.name
      password = "password"
      
      User.create!(
                  name: name,
                  email: email,
                  password: password,
                  password_confirmation: password)
     end
   end
   
   def make_microposts
     users = User.all(limit: 6)
      50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
     end
   end
end