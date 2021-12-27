# frozen_string_literal: true

class CookBookController < ApplicationController
  skip_before_action :require_login, only: %i[main_page cook_page]

  def main_page
    @recipes = Recipe.all.map do |elem|
      { id: elem.id, name: elem.name, ingred: elem.ingred, level: elem.level, descrip: elem.descrip, image: elem.image,
        time: elem.time, username: User.find_by(id: elem.user_id).username }
    end.each_slice(2).map.to_a
  end
end
