class Tag < ActiveRecord::Base
  has_many :material_tag_links
  has_many :materials, through: :material_tag_links
end
