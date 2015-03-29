class Keyword < ActiveRecord::Base
  include PgSearch
  multisearchable :against => { :keyword => 'B' }
  
  has_many :pages, through: :page_keywords
end
