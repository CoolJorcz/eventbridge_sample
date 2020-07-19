describe EventBridgeService do
  describe "#call" do
    let(:entry) { double('entry', error_code: nil, error_message: nil, event_id: SecureRandom.uuid)}
    let(:data_struct) do
      instance_double('data', entries: [ entry ], failed_entry_count: 0)
    end
    let(:response_object) do
      instance_double(Seahorse::Client::Response, data: data_struct)
    end
    let(:event_bridge_client) do
      double(Aws::EventBridge::Client, {
               put_events: response_object
             })
    end

    before do
      allow(subject).to receive(:client).and_return(event_bridge_client)
    end

    it "calls PutEvents on the Aws::EventBridge::Client" do
      expect(event_bridge_client).to receive(:put_events)
      subject.call(detail: { data: "to send" }, detail_type: "transaction_service")
    end
  end
end
