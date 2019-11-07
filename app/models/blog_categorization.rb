class BlogCategorization < ApplicationRecord
  belongs_to :blog
  belongs_to :subcategory
end
