describe Tag do

  subject(:tag) { described_class }

  describe '#self.get_ids' do
    it 'returns an array of ids from an array of tag names' do

      10.times do
        FactoryGirl.create :tag
      end

      tags = Tag.all.select {|tag| tag.id.even?}
      tag_names = tags.map(&:name)
      tag_ids = tags.map(&:id)

      expect(tag.get_ids(tag_names:tag_names)).to eq tag_ids
    end
  end

end
