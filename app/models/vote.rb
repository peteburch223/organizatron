class Vote < ActiveRecord::Base
  belongs_to :material_tag_link
  # belongs_to :tag, through: :material_tag
end
