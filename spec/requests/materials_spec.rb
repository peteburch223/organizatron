describe "Materials API" do
  describe "GET /materials" do
    it "returns all the materials" do
      build(:material)

      get "/materials", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      materials_url = body.map { |m| m["url"] }

      expect(movie_titles).to match_array(["https://github.com/makersacademy/course/blob/master/rails/yelpv1.md#installing-rails-and-initialising-your-app"])
    end
  end
end
