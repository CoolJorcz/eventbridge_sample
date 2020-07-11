require 'rails_helper'

RSpec.describe PaymentServiceJob, type: :job do
  let(:transaction_hash){ create(:transaction).as_json }


  it 'sends a job to eventbridge' do
    expect_any_instance_of(EventBridgeService).to receive(:call)
    described_class.new.perform(payload: transaction_hash)
  end
end
