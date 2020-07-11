
describe Transaction, type: :model do
  before do
    FactoryBot.create(:transaction)
  end

  describe 'associations' do
    it { is_expected.to belong_to(:book) }
  end
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:customer_email) }  
    it { is_expected.to validate_presence_of(:transaction_id) }
    it { is_expected.to validate_uniqueness_of(:transaction_id) }
    it { is_expected.to validate_presence_of(:sale_price) }
  end
end
