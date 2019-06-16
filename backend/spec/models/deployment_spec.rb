RSpec.describe Deployment, type: :model do
  let(:deployment) { build(:deployment) }

  it 'is valid' do
    expect(deployment).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:service) }
  end
end
