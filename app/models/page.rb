class Page < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :author, :description]
  pg_search_scope :find_relevant_pages, :against => [:title, :author, :description], :associated_against => { :keywords => [:keyword] }

  belongs_to :site
  has_many :keywords, through: :page_keywords
  has_many :page_keywords
  has_many :page_views
end
