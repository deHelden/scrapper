class NewSLine < ApplicationRecord
  validates :title, uniqueness: true
end
