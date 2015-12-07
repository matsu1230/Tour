class Reservation < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :member_id, :detail_id, :people, :food, :canceld
  belongs_to :member
  belongs_to :detail

 validates :people, presence: true, length: { maximum: 2 }
 validates :food, presence: true

end
