describe "tags API" do
  describe "GET /tags" do
    it "returns all the tags" do
      expected_result = FactoryGirl.create :tag

      get "/tags", {}, { "Accept" => "application/json" }

      body = JSON.parse(response.body).first
      body.keep_if { |k,v| ["name"].include? k }

      expect(response.status).to eq 200
      expect(body["name"]).to eq expected_result.name
    end
  end
end
