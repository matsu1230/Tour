class Detail < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :details, :start, :end, :price, :limit, :lowst, :trip_id
  belongs_to :trip
 has_many :reservations, dependent: :destroy

end
