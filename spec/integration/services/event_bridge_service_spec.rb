require 'rails_helper'

describe EventBridgeService, :integration do
  describe 'Transaction creation to EventBridge' do
    # TODO: Attach localstack to prove out EventBridge connection
    let!(:transaction){ FactoryBot.create(:transaction) }
    let(:serialized_transaction){ TransactionSerializer.new(transaction)}

    it 'sends an event to the EventBridge' do
      detail = serialized_transaction.to_json
      expect(PaymentServiceJob).to receive(:perform_later) do |payload|
        PaymentServiceJob.perform_now(payload)
      end

      expect_any_instance_of(described_class).to receive(:call)
                                             .with(detail: detail, 
                                                   detail_type: 'payment_service').and_call_original
      expect_any_instance_of(Aws::EventBridge::Client).to receive(:put_events).and_call_original
      transaction.save
    end
  end
end