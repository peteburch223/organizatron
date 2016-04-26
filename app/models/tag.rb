class Tag < ActiveRecord::Base
  # has_and_belongs_to_many :materials


  has_many :material_tag_links
  has_many :materials, through: :material_tag_links
  has_many :votes, through: :material_tag_links

end
