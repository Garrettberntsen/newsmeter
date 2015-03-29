class Page < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :author, :description]

  belongs_to :site
  has_many :keywords, through: :page_keywords
  has_many :page_keywords
  has_many :page_views
end
