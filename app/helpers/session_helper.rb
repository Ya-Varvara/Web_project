# frozen_string_literal: true

module SessionHelper
  def sign_in(user)
    cookies.signed[:user_id] = { value: user.id, expires: 1.hour }
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.signed[:user_id] = nil
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(cookies.signed[:user_id])
  end
end
