# frozen_string_literal: true

json.extract! recipe, :id, :name, :level, :ingred, :descrip, :time, :image, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
