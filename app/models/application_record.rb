class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :distinct_size, ->(col) { select(col).distinct(col).size }
end
