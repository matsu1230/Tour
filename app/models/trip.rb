class Trip < ActiveRecord::Base
   attr_accessible :tourname, :tourcontent, :category, :subcategory
   has_many :details, dependent: :destroy
   has_many :reviews, dependent: :destroy
   has_many :reviewrs, through: :reviews, source: :member

   class << self
     def search(query)
       rel = order("id")
       if query.present?
         rel = rel.where("tourname LIKE ? OR category LIKE ? OR subcategory LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
       end
       rel
     end
   end
end
