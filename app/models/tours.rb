class Tours < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :tourname, :tourcontent, :category, :subcategory
end
