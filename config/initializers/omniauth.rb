Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], {:scope => 'public_profile,email,user_friends', :info_fields => 'name,email,friends'}
end