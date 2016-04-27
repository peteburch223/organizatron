# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tags = [Tag.create(name: "Angular"), Tag.create(name: "Rails"),Tag.create(name: "MEAN"),Tag.create(name: "Sinatra")]



30.times do |n|
 material = Material.create(title: "Title #{n}", link_url: "http://link#{n}.com", description: "Description #{n}")

 if n%2 == 0
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[3].id)
 end

 if n%3== 0
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[2].id)
 end

 if n%4== 0
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[1].id)
 end

 if n%5== 0
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[1].id)
 end
end
