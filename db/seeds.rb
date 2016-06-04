# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Topic.transaction do
  CSV.foreach(Rails.root + 'data/topics.csv',
              headers: true) do |topic_row|
    topic = topic_row.to_hash
    next if Flag.exists? topic
    Flag.create!(topic)
  end
end
