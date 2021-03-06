# frozen_string_literal: true

require 'dry/validation'

module Mercury
  module Notification
    class Deliver < Trailblazer::Operation
      extend Contract::DSL

      self['transports.map'] = {
        'apns' => ::Mercury::Transport::Apns::Dispatch,
        'action_cable' => ::Mercury::Transport::ActionCable::Dispatch,
        'pubnub' => ::Mercury::Transport::Pubnub::Dispatch
      }

      contract 'params', (Dry::Validation.Schema do
        required(:notification).filled
      end)

      step Contract::Validate(name: 'params')
      step :deliver!

      def deliver!(options, params:, **)
        params[:notification].transports.each_key do |transport|
          options["result.transports.#{transport}"] = options['transports.map'][transport].call(
            notification: params[:notification]
          )
        end

        params[:notification].transports.keys.all? do |transport|
          options["result.transports.#{transport}"].success?
        end
      end
    end
  end
end
