class Material < ActiveRecord::Base
  has_many :material_tag_links
  has_many :tags, through: :material_tag_links
  has_many :votes, through: :material_tag_links


  def self.having_tags(args)
  end
end
