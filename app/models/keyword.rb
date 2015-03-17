class Keyword < ActiveRecord::Base
	has_many :pages, through: :page_keywords
end
