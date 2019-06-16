RSpec.describe Service, type: :model do
  let(:service) { build(:deployment) }

  it 'is valid' do
    expect(service).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
