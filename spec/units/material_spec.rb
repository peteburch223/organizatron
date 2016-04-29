describe Material do

  subject(:material) { described_class }

  it { is_expected.to respond_to(:having_tags).with(1).argument}

  describe '#self.having_tags' do
    it 'returns an array of materials from an array of tag names' do

      material_1 = FactoryGirl.create(:material)
      material_2 = FactoryGirl.create(:material)
      material_3 = FactoryGirl.create(:material)

      tag_1 = FactoryGirl.create(:tag)
      tag_2 = FactoryGirl.create(:tag)
      tag_3 = FactoryGirl.create(:tag)

      material_tag_link_1 = FactoryGirl.create(:material_tag_link)
      material_tag_link_2 = FactoryGirl.create(:material_tag_link)
      material_tag_link_3 = FactoryGirl.create(:material_tag_link)
      material_tag_link_4 = FactoryGirl.create(:material_tag_link)
      material_tag_link_5 = FactoryGirl.create(:material_tag_link)

      link_material_with_tag(material_tag_link_1, material_1, tag_1)
      link_material_with_tag(material_tag_link_2, material_1, tag_2)
      link_material_with_tag(material_tag_link_3, material_2, tag_1)
      link_material_with_tag(material_tag_link_4, material_2, tag_3)
      link_material_with_tag(material_tag_link_5, material_3, tag_2)



      tags = Tag.all.select {|tag| tag.id.even?}
      tag_names = tags.map(&:name)
      tag_ids = tags.map(&:id)

      expect(tag.get_ids(tag_names:tag_names)).to eq tag_ids
    end
  end

end
