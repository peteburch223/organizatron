describe "votes API" do

  let(:material_tag_link) { build(:material_tag_link) }
  let(:material) { build(:material) }
  let(:tag) { build(:tag) }

  describe "POST /votes" do
    it 'creates a vote' do

      link_material_with_tag(material_tag_link, material, tag)

      value = 1
      tag_id = material_tag_link.tag_id
      material_id = material_tag_link.material_id

      vote_params = {
        "vote" => {
          "value" => value,
          "tag_id" => tag_id,
          "material_id" => material_id
        }
      }.to_json

        # p material_params

      request_headers = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      post "/votes", vote_params, request_headers
      expect(response.status).to eq 201
      expect(Vote.first.value).to eq 1
      expect(Vote.first.material_tag_link_id).to eq material_tag_link.id
    end
  end
end
