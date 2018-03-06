# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_file = Rails.root.join('db', 'seeds.yml')
my_hash = HashWithIndifferentAccess.new(YAML::load_file(seed_file))

my_hash[:projects].each do |project|

    p = Project.new(title: project[:title])
    puts project[:title]
    p.save!
    project[:todos].each do |todo|
        todo = p.todos.create(text: todo[:text], isCompleted: todo[:isCompleted])
        p.todos << todo
        puts todo[:text]
        puts todo[:isCompleted]
        todo.save!
    end
end
