# frozen_string_literal: true

class PlanningRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room]}"
  end
end
