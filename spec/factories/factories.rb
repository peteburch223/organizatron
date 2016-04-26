FactoryGirl.define do
  factory :material do |m|

    m.sequence(:title) { |n| "Title#{n}" }
    m.sequence(:link_url) { |n| "URL#{n}" }
    m.sequence(:description) { |n| "Desc#{n}" }

  end

  factory :tag do |t|
    t.sequence(:name) { |n| "Tag#{n}" }
  end

  factory :vote, parent: :material_tag_link do |v|
    v.sequence(:value) { |n| n }
  end

  factory :materials_tags, parent: :tag do
    materials {[FactoryGirl.create(:material),FactoryGirl.create(:material)]}
  end





end
