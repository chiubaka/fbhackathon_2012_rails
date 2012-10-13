class ToLink < ActiveRecord::Base
  attr_accessible :frequency, :from_link_id, :url
  belongs_to :from_link
end
