User.create!(
             firstName:  "Abdullah",
             lastName: "Faraj",
             username: "Traxbay",
             email: "xare92@hotmail.com",
             password:              "abdulah9",
             password_confirmation: "abdulah9",
             admin: true
           )

99.times do |n|
  username  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(firstName:  username,
               lastName: username,
               username: username,
               email: email,
               password:              password,
               password_confirmation: password)
end
