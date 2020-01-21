# frozen_string_literal: true

class PlanningRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "room_#{params[:room]}"
    stream_from "room"
  end
end
