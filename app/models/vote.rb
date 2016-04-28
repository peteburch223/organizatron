class Vote < ActiveRecord::Base
  belongs_to :material_tag_link
  has_one :material, through: :material_tag_links
  has_one :tag, through: :material_tag_links
end
