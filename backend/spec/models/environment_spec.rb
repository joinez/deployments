RSpec.describe Environment, type: :model do
  let(:environment) { build(:environment) }

  it 'is valid' do
    expect(environment).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
