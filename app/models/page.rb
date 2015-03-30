class Page < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :author, :description]
  pg_search_scope :find_relevant_pages, :against => [ [:title, 'A'], [:author, 'D'], [:description, 'C'] ], :associated_against => { :keywords => {:keyword => 'B'} }, :using => { :tsearch => {:dictionary => "english", :normalization => 2} }

  belongs_to :site
  has_many :keywords, through: :page_keywords
  has_many :page_keywords
  has_many :page_views
end
