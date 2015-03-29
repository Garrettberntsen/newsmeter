class Keyword < ActiveRecord::Base
  include PgSearch
  multisearchable :against => :keyword
  
  has_many :pages, through: :page_keywords
end
