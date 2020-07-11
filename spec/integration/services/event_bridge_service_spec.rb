require 'rails_helper'

describe EventBridgeService, :integration do
  describe 'Transaction creation to EventBridge' do
    # TODO: Attach localstack to prove out EventBridge connection
    let!(:transaction){ FactoryBot.build(:transaction) }
    let(:serialized_transaction){ TransactionSerializer.new(transaction)}
    it 'sends an event to the EventBridge' do
      expect(PaymentServiceJob).to receive(:perform_later) do |payload|
        PaymentServiceJob.perform_now(payload)
      end
      expect_any_instance_of(described_class).to receive(:call)
                                             .with(detail: serialized_transaction.as_json, 
                                                   detail_type: 'payment_service')
      transaction.save
    end
  end
end