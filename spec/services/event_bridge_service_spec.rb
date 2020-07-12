describe EventBridgeService do
  describe "#call" do
    let(:event_bridge_client) do
      double(Aws::EventBridge::Client, {
               put_events: ->(_event) { SecureRandom.hex },
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
