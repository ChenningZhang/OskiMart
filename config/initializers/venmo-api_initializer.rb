Rails.application.config.before_initialize do
    ::Venmo = VenmoAPI::Client.new do |config|
      config.client_id = 3195
      config.secret = 'bKRVaunyQhQQAH7UzRDMbf9Qc2bARdAQ'
      config.scope = ['make_payments', 'access_feed', 'access_profile', 'access_email', 'access_phone', 'access_balance', 'access_friends']
      config.response_type = 'code'
    end
  end