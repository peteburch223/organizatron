FactoryGirl.define do
  factory :material do |m|

    m.sequence(:title) { |n| "Title#{n}" }
    m.sequence(:link_url) { |n| "URL#{n}" }
    m.sequence(:description) { |n| "Desc#{n}" }

  end

  factory :tag do |t|
    t.sequence(:name) { |n| "Tag#{n}" }
  end

  factory :vote do |v|
    v.sequence(:value) { rand(0..2) - 1 }
  end

  factory :material_tag_link do
    tag = FactoryGirl.create(:tag)
    material = FactoryGirl.create(:material)
  end

  # factory :material_tag_link, parent: :tag do
  #   materials {[FactoryGirl.create(:material),FactoryGirl.create(:material)]}
  #   votes {[FactoryGirl.create(:vote),FactoryGirl.create(:vote),FactoryGirl.create(:vote)]}
  # # end
  #
  # factory :material_tag_link do
  #
  #   after_create do |material_tag_link|
  #
  #     require 'pry';binding.pry
  #
  #     p material_tag_link.materials.class
  #     material_tag_link.material_id = FactoryGirl.create(:material).id
  #     # material_tag_link.materials << FactoryGirl.create(:material)
  #
  #     material_tag_link.tag_id = FactoryGirl.create(:tag).id
  #     # material_tag_link.tags << FactoryGirl.create(:tag)
  #   end
  # end

  #   association :material
  #   association :tag
  #   # materials {[FactoryGirl.create(:material),FactoryGirl.create(:material)]}
  #   # tags {[FactoryGirl.create(:tag),FactoryGirl.create(:tag)]}
  # end






end
