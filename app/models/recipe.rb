class Recipe < ApplicationRecord
  validates :name, :descrip, :ingred, :time, :level, presence: true

end
