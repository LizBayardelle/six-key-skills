class Subscriber < ApplicationRecord
  belongs_to :resource, optional: true
end
