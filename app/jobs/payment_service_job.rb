class PaymentServiceJob < ApplicationJob
  queue_as :payment

  def perform(payload:)
    detail_type = 'payment_service'
    EventBridgeService.new.call(detail: payload, detail_type: detail_type)
  end
end
