FactoryGirl.define do
  factory :material do
    title "Test Driving a JSON API in Rails"
    link_url "http://commandercoriander.net/blog/2014/01/04/test-driving-a-json-api-in-rails/"
    description "this is quite useful"
  end

  factory :tag do
    name "interesting"
  end
end
