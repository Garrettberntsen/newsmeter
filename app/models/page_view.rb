class PageView < ActiveRecord::Base
	belongs_to :user
	belongs_to :page
	has_many :keywords, through: :page
end
