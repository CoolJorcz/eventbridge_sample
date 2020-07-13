class EventBridgeService
  attr_reader :options, :client

  def initialize(options: default_options)
    @options = options
    @client = Aws::EventBridge::Client.new(
      region: @options[:region],
    )
  end

  def call(detail:, detail_type:)
    event_payload = craft_event(detail, detail_type)
    resp = client.put_events(entries: [event_payload])

    if resp.entries.any?(&:error_code)
      resp.entries.each do |entry|
        error_code = "EventBridge error code: #{entry.error_code}, message: #{entry.error_message}"
        Rails.logger.error(error_code)
      end

      return
    end

    { event_ids: resp.entries.map(&:event_id) }
  rescue StandardError => e
    Rails.logger.error("EventBridge error: #{e}")
  end

  def craft_event(detail, detail_type)
    {
      time: Time.zone.now.to_s,
      source: options[:source],
      resources: [""],
      event_bus_name: options[:event_bus_name],
      detail: detail,
      detail_type: detail_type,
    }
  end

  private

  attr_reader :source

  def default_options
    {
      region: "us-west-2",
      event_bus_name: "default",
      source: "bookstore-us-west-2",
    }
  end
end
