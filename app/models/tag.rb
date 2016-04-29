class Tag < ActiveRecord::Base
  has_many :material_tag_links
  has_many :materials, through: :material_tag_links
  has_many :votes, through: :material_tag_links


  def self.get_ids(args)
    args[:tag_names].map do |tag|
      found_tag = self.find_by name: tag
      found_tag ? found_tag.id : nil
    end
  end
end
