# encoding:utf-8

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #
  # 關閉這一行就等於關閉 CSRF 保護
  # protect_from_forgery with: :exception
end
