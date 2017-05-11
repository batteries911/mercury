# frozen_string_literal: true

require 'dry/validation'

module Mercury
  module Notification
    class Deliver < Trailblazer::Operation
      extend Contract::DSL

      self['transports.map'] = {
        'apn' => ::Mercury::Transport::APN
      }

      contract 'params', (Dry::Validation.Schema do
        required(:notification).filled
      end)

      step Contract::Validate(name: 'params')
      step :deliver!

      def deliver!(options, params:, **)
        params[:notification].transports.each do |transport|
          options['transports.map'][transport].call(notification: params[:notification])
        end
      end
    end
  end
end
