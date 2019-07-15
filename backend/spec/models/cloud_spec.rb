RSpec.describe Cloud, type: :model do
  let(:cloud) { build(:cloud) }

  it 'is valid' do
    expect(cloud).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
