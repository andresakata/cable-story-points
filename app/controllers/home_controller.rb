# frozen_string_literal: true

class HomeController < ApplicationController
  def index
  end

  def login
    unless valid_login?
      render :index
      return
    end

    cookies[:user] = params[:user]
    cookies[:room] = params[:room]
    redirect_to planning_room_url
  end

  private

  def valid_login?
    params[:user].present? && params[:room].present?
  end
end
