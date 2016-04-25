
describe "materials API" do
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
  end
end
