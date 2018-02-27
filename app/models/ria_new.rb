class RiaNew < ApplicationRecord
  validates :title, uniqueness: true
end
