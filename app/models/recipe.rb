# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates_format_of :name, without: /\d/
  validates :time, presence: true, numericality: { only_integer: true }, length: { maximum: 3 }
  validates :ingred, :descrip, presence: true
  validates_format_of :image, with: %r{(^\s*$)|(https:/)}
end
