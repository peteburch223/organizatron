# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# tags = [Tag.create(name: "Angular"), Tag.create(name: "Rails"),Tag.create(name: "MEAN"),Tag.create(name: "Sinatra")]
tag_array = ["Angular", "Bootstrap", "CSS", "Rails", "NodeJs", "Sinatra", "MEAN"]
tags = tag_array.map { |tag| Tag.create(name: "#{tag}")}
@material_array = [
  {
    title: "angularMe",
    link_url: "http://link.com",
    description: "Venison shank shankle, jowl salami pork chuck cow meatball. Porchetta jowl ham short ribs. Leberkas picanha prosciutto tail pastrami pancetta. Capicola turkey boudin strip steak, shank biltong beef ribs."
  },
  {
    title: "Newangular",
    link_url: "http://link.com",
    description: "Cotton candy cookie cake sweet roll. Oat cake chupa chups wafer jelly beans brownie sesame snaps. Tiramisu danish tootsie roll halvah danish sweet roll chocolate cake bonbon."
  },
  {
    title: "Diyruby",
    link_url: "http://link.com",
    description: "Cotton candy cookie cake sweet roll. Oat cake chupa chups wafer jelly beans brownie sesame snaps. Tiramisu danish tootsie roll halvah danish sweet roll chocolate cake bonbon."
  },
  {
    title: "rubyEasy",
    link_url: "http://link.com",
    description: "Bacon ipsum dolor amet pork chop cow strip steak turducken. Venison doner landjaeger short loin filet mignon t-bone ground round strip steak. Turducken ball tip tenderloin, t-bone tri-tip meatloaf chuck corned beef capicola tail beef cow. Jowl salami drumstick filet mignon pastrami bresaola porchetta shank pig strip steak alcatra ground round tail pork belly andouille."
  },
  {
    title: "Chicangular",
    link_url: "http://link.com",
    description: "Dragée wafer danish. Pastry tart chocolate cake. Pie biscuit tiramisu bear claw."
  },
  {
    title: "Diynode",
    link_url: "http://link.com",
    description: "Bacon ipsum dolor amet pork chop cow strip steak turducken. Venison doner landjaeger short loin filet mignon t-bone ground round strip steak. Turducken ball tip tenderloin, t-bone tri-tip meatloaf chuck corned beef capicola tail beef cow. Jowl salami drumstick filet mignon pastrami bresaola porchetta shank pig strip steak alcatra ground round tail pork belly andouille."
  },
  {
    title: "nodeHip",
    link_url: "http://link.com",
    description: "Dragée wafer danish. Pastry tart chocolate cake. Pie biscuit tiramisu bear claw."
  },
  {
    title: "nodeGet",
    link_url: "http://link.com",
    description: "Venison shank shankle, jowl salami pork chuck cow meatball. Porchetta jowl ham short ribs. Leberkas picanha prosciutto tail pastrami pancetta. Capicola turkey boudin strip steak, shank biltong beef ribs."
  },
  {
    title: "CSS Today",
    link_url: "http://link.com",
    description: "Bacon ipsum dolor amet pork chop cow strip steak turducken. Venison doner landjaeger short loin filet mignon t-bone ground round strip steak. Turducken ball tip tenderloin, t-bone tri-tip meatloaf chuck corned beef capicola tail beef cow. Jowl salami drumstick filet mignon pastrami bresaola porchetta shank pig strip steak alcatra ground round tail pork belly andouille."
  },
  {
    title: "Joes Blog",
    link_url: "http://link.com",
    description: "Dragée wafer danish. Pastry tart chocolate cake. Pie biscuit tiramisu bear claw."
  },
  {
    title: "Programmer's Daily",
    link_url: "http://link.com",
    description: "Venison shank shankle, jowl salami pork chuck cow meatball. Porchetta jowl ham short ribs. Leberkas picanha prosciutto tail pastrami pancetta. Capicola turkey boudin strip steak, shank biltong beef ribs."
  },
  {
    title: "Google Jobs",
    link_url: "http://link.com",
    description: "Cotton candy cookie cake sweet roll. Oat cake chupa chups wafer jelly beans brownie sesame snaps. Tiramisu danish tootsie roll halvah danish sweet roll chocolate cake bonbon."
  },
  {
    title: "Tech News",
    link_url: "http://link.com",
    description: "Cotton candy cookie cake sweet roll. Oat cake chupa chups wafer jelly beans brownie sesame snaps. Tiramisu danish tootsie roll halvah danish sweet roll chocolate cake bonbon."
  },
  {
    title: "Forum Link",
    link_url: "http://link.com",
    description: "Bacon ipsum dolor amet pork chop cow strip steak turducken. Venison doner landjaeger short loin filet mignon t-bone ground round strip steak. Turducken ball tip tenderloin, t-bone tri-tip meatloaf chuck corned beef capicola tail beef cow. Jowl salami drumstick filet mignon pastrami bresaola porchetta shank pig strip steak alcatra ground round tail pork belly andouille."
  },
  {
    title: "Github API",
    link_url: "http://link.com",
    description: "Cotton candy cookie cake sweet roll. Oat cake chupa chups wafer jelly beans brownie sesame snaps. Tiramisu danish tootsie roll halvah danish sweet roll chocolate cake bonbon."
  },
  {
    title: "Create",
    link_url: "http://link.com",
    description: "Venison shank shankle, jowl salami pork chuck cow meatball. Porchetta jowl ham short ribs. Leberkas picanha prosciutto tail pastrami pancetta. Capicola turkey boudin strip steak, shank biltong beef ribs."
  },
  {
    title: "CSS Awards",
    link_url: "http://link.com",
    description: "Venison shank shankle, jowl salami pork chuck cow meatball. Porchetta jowl ham short ribs. Leberkas picanha prosciutto tail pastrami pancetta. Capicola turkey boudin strip steak, shank biltong beef ribs."
  },
  {
    title: "Design",
    link_url: "http://link.com",
    description: "Dragée wafer danish. Pastry tart chocolate cake. Pie biscuit tiramisu bear claw."
  },
  {
    title: "Makers",
    link_url: "http://link.com",
    description: "Cotton candy cookie cake sweet roll. Oat cake chupa chups wafer jelly beans brownie sesame snaps. Tiramisu danish tootsie roll halvah danish sweet roll chocolate cake bonbon."
  },
  {
    title: "Hack-a-day",
    link_url: "http://link.com",
    description: "Bacon ipsum dolor amet pork chop cow strip steak turducken. Venison doner landjaeger short loin filet mignon t-bone ground round strip steak. Turducken ball tip tenderloin, t-bone tri-tip meatloaf chuck corned beef capicola tail beef cow. Jowl salami drumstick filet mignon pastrami bresaola porchetta shank pig strip steak alcatra ground round tail pork belly andouille."
  }
]
# @material.map { |material_item| Material.create(material_item) }
20.times do |n|
  material = Material.create(@material_array[n])
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
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[0].id)
 end
 if n%6== 0
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[4].id)
 end
 if n%7== 0
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[5].id)
 end
 if n%8== 0
   mtl = MaterialTagLink.create(material_id: material.id, tag_id: tags[6].id)
 end
end
4.times do
  MaterialTagLink.all.each do |mtl|
    vote = (rand(2) == 0 ? -1 : 1)
    mtl.votes << Vote.new(value: vote)
  end
end
