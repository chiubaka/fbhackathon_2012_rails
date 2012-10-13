class Edge < ActiveRecord::Base
  attr_accessible :from, :to
  serialize :to
end
