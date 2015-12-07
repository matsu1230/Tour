class Review < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :reviewtitle, :reviewcontent, :trip_id, :member_id
  belongs_to :trip
  belongs_to :member
end
