xdescribe "votes API" do
  describe "POST /votes" do
    it 'creates a vote' do
      value = 1

      tag_id = 1
      material_id = 1

      vote_params = {
        "value" => value,
        "tag_id" => tag_id,
        "material_id" => material_id
        }.to_json

        # p material_params

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post "/votes", vote_params, request_headers
      expect(response.status).to eq 201
      expect(Vote.first.value).to eq 1
      # expect(Material.first.link_url).to eq link_url
      # expect(Material.first.description).to eq description
      # expect(Material.first.tags.last.name).to eq "tag2"
    end
  end
end
