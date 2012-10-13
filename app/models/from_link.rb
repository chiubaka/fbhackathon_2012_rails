class FromLink < ActiveRecord::Base
  attr_accessible :url
  has_many :to_links
end
