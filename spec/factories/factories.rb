FactoryGirl.define do
  factory :material do |m|

    m.sequence(:title) { |n| "Title#{n}" }
    m.sequence(:link_url) { |n| "URL#{n}" }
    m.sequence(:description) { |n| "Desc#{n}" }

  end

  factory :tag do |t|
    t.sequence(:name) { |n| "Tag#{n}" }
  end

  factory :materials_tags, parent: :tag do
    materials {[FactoryGirl.create(:material),FactoryGirl.create(:material)]}
  end

end
