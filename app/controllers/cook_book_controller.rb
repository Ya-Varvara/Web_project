class CookBookController < ApplicationController
  skip_before_action :require_login, only: %i[main_page cook_page]
  def main_page

  end

  def user_page
  end

  def cook_page

  end
end
