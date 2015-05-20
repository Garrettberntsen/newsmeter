class Authorization < ActiveRecord::Base
	belongs_to :user
	validates :provider, :uid, :presence => true

	def self.find_or_create(auth_hash)
		unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
			puts auth_hash["info"]["name"]
			puts auth_hash["info"]["email"]
			puts auth_hash["info"]["literallyanything"]
			puts auth_hash.inspect
			user = User.create :name => (auth_hash["info"]["name"].nil? ? "" : auth_hash["info"]["name"] ), :email => (auth_hash["info"]["email"].nil? ? "" : auth_hash["info"]["email"])
			auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
		end

		auth

	end

end
