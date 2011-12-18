# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



hp = HomePage.create()

home_page = Page.create({
  'name' => 'Home Page',
  'pageable_type' => hp.class.to_s,
  'pageable_id' => hp.id
  })

sv = Service.create({'content' => 'Parkin is a full-service architecture firm that customizes our solutions to the unique needs of each client.'})
#profile_page = Page.create({'name' => 'Profile'})

Page.create({
  'name' => 'Services',
  'pageable_type' => sv.class.to_s,
  'pageable_id' => sv.id
})


Project.create({
  'project_type' => 6,
  'area' => '20,000 sqre feet',
  'city' => 'Toronto',
  'province' => 'Ontario',
  'completion_date' => 'Fall 2010',
  'is_renowned' => true,
  'created_at' => DateTime.new,
  'updated_at' => DateTime.new,
  'client_name' => 'Hospital for Sick Children',
  'costs' => '15,000,000',
  'name' => 'Sick Kids Addition',
  'description' => 'A large modification to the east wing.'
})

Project.create({
  'project_type' => 2,
  'area' => '100,000 square feet',
  'city' => 'Hamilton',
  'province' => 'Ontario',
  'completion_date' => 'Spring 2008',
  'is_renowned' => false,
  'created_at' => DateTime.new,
  'updated_at' => DateTime.new,
  'client_name' => "St. Mary's General Hospital",
  'costs' => '5,000,000',
  'name' => 'Added new building',
  'description' => 'A large modification to the east wing.'
})


NewsItem.create({
  'title' => 'A new project finished',
  'body' => '<p>This the body of the article</p>',
  'published_date' => Date.new(2008,11,8),
  'created_at' => DateTime.new,
  'updated_at' => DateTime.new,
  'news_type' => 0,
  'important' => true
})

NewsItem.create({
  'title' => 'We like to make buildings pretty',
  'body' => '<p>This the body of the article2</p>',
  'published_date' => Date.new(2009, 07,17),
  'created_at' => DateTime.new,
  'updated_at' => DateTime.new,
  'news_type' => 1,
  'important' => false
})