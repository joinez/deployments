RSpec.describe Deployment, type: :model do
  let(:deployment) { build(:deployment) }

  it 'is valid' do
    expect(deployment).to be_valid
  end
end
