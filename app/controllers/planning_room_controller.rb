# frozen_string_literal: true

class PlanningRoomController < ApplicationController
  before_action :require_login

  def index
  end

  def set_points
    ActionCable.server.broadcast(
      "room_#{cookies[:room]}",
      { user: cookies[:user], points: params[:points] }
    )
    head :ok
  end

  private

  def require_login
    return if cookies[:user].present? && cookies[:room].present?
    redirect_to root_url
  end
end
