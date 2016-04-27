
describe "materials API" do

  let(:material_tag_link) { build(:material_tag_link) }
  let(:material_tag_link2) { build(:material_tag_link) }
  let(:material) { build(:material) }
  let(:material2) { build(:material) }
  let(:tag) { build(:tag) }

  describe "GET /materials" do
    it "returns all the materials" do
      expected_result = FactoryGirl.create :material

      get "/materials", {}, { "Accept" => "application/json" }

      body = JSON.parse(response.body).first
      body.keep_if { |k,v| ["link_url","title","description"].include? k }

      expect(response.status).to eq 200
      expect(body["link_url"]).to eq expected_result.link_url
      expect(body["title"]).to eq expected_result.title
      expect(body["description"]).to eq expected_result.description
    end


  it "returns all the materials associated with a tag" do
    link_material_with_tag(material_tag_link, material, tag)
    link_material_with_tag(material_tag_link2, material2, tag)

    get "/tags", {}, { "Accept" => "application/json" }

    body = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(body.first["id"]).to eq material_tag_link.id
    expect(body.first["name"]).to eq material_tag_link.tag.name
    expect(body.first["materials"].count).to eq 2
    expect(body.first["materials"].last["description"]).to eq material_tag_link2.material.description
    expect(body.first["materials"].last["id"]).to eq material_tag_link2.material.id
    # expect(body.first["materials"].last["votes"]).to eq material_tag_link.votes.last.id
  end
end


  describe "POST /materials" do
    it 'creates a material' do
      title = "material title"
      link_url = "http://#/"
      description = "description"
      tags = ["tag1", "tag2"]

      material_params = {
        "material" => {
          "title" => title,
          "link_url" => link_url,
          "description" => description,
          "tags" => tags
          # "tags" => [{"name"=> "tag1"}, {"name"=> "tag2"}]
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
      expect(Material.first.tags.last.name).to eq "tag2"
    end
  end
 end
