# frozen_string_literal: true

class ProfilesChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_profile
  end
end
