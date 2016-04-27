class MaterialTagLink < ActiveRecord::Base
  has_many :votes
  belongs_to :material
  belongs_to :tag
end
