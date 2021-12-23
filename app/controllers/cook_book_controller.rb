class CookBookController < ApplicationController
  skip_before_action :require_login, only: %i[main_page cook_page]

  def main_page
    @recipes = Recipe.all.map { |elem| { id: elem.id, name: elem.name, ingred: elem.ingred, descrip: elem.descrip, time: elem.time, username: User.find_by(id: elem.user_id).username } }.each_slice(2).map
    p @recipes

  end
end
