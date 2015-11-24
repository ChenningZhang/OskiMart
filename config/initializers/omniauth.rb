Rails.application.config.middleware.use OmniAuth::Builder do
   provider :venmo, '3195', 'bKRVaunyQhQQAH7UzRDMbf9Qc2bARdAQ', :scope => 'access_feed,access_profile,access_friends,make_payments'   
end