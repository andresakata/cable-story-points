# frozen_string_literal: true

class PlanningRoomController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    return if cookies[:user].present? && cookies[:room].present?
    redirect_to root_url
  end
end
