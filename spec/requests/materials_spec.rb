
describe "materials API" do

  before(:each) do

  end
  describe "GET /materials" do
    it "returns all the materials" do
      expected_result = FactoryGirl.create :material

      get "/materials", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body).first
      body.keep_if { |k,v| ["link_url","title","description"].include? k }

      expect(body["link_url"]).to eq expected_result.link_url
      expect(body["title"]).to eq expected_result.title
      expect(body["description"]).to eq expected_result.description
    end


  it "returns all the materials associated with a tag" do
    expected_result = FactoryGirl.create(:materials_tags)
    get "/tags", {}, { "Accept" => "application/json" }

    expect(response.status).to eq 200

    body = JSON.parse(response.body)

    expect(body.first["name"]).to eq expected_result.name
    expect(body.first["materials"].count).to eq 2
    expect(body.first["materials"].last["description"]).to eq expected_result.materials.last.description
  end
end


  describe "POST /materials" do
    it 'creates a material' do
      title = "Yelp V1 walkthrough"
      link_url = "https://github.com/makersacademy/course/blob/master/rails/yelpv1.md#installing-rails-and-initialising-your-app"
      description = "would be a bit stuck without this one"

      material_params = {
        "material" => {
          "title" => title,
          "link_url" => link_url,
          "description" => description
          }
        }.to_json

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post "/materials", material_params, request_headers
      expect(response.status).to eq 201
      expect(Material.first.title).to eq title
      expect(Material.first.link_url).to eq link_url
      expect(Material.first.description).to eq description
    end

    xit "responds with errors" do

      material_params = {
        "material" => {}
        }.to_json

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post "/materials", material_params, request_headers

      expect(response.status).to eq(422)
    end
  end
 end
