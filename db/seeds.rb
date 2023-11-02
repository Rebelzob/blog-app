require 'faker'

users = [13, 12]
posts = [19, 20, 17, 18, 21, 22, 23, 24]

users.each do |user_id|
  posts.each do |post_id|
    20.times do |i|
      Comment.create!(
        user_id: user_id, 
        post_id: post_id, 
        text: Faker::Lorem.sentence
      )
    end
  end
end
