RSpec.describe DeploymentVersion, type: :model do
  let(:deployment_version) { build(:deployment_version) }

  it 'is valid' do
    expect(deployment_version).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:deployment) }
    it { should validate_presence_of(:service) }
    it { should validate_presence_of(:version) }
  end
end
