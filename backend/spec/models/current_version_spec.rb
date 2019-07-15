RSpec.describe CurrentVersion, type: :model do
  let(:current_version) { build(:current_version) }

  it 'is valid' do
    expect(current_version).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:environment) }
    it { should validate_presence_of(:deployment) }
    it { should validate_presence_of(:service) }
    it { should validate_presence_of(:version) }
  end
end
