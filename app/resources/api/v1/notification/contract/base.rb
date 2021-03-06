# frozen_string_literal: true

module API
  module V1
    module Notification
      module Contract
        class Base < Pragma::Contract::Base
          property :recipient_type
          property :recipient_id
          property :text
          property :transports
          property :meta

          validation do
            configure do
              def self.messages
                super.merge(en: {
                  errors: {
                    recipient_id: 'must be a valid recipient ID',
                    type: 'one of channel_name or recipient allowed'
                  }
                })
              end

              predicates API::V1::Common::Contract::Predicates
            end

            required(:recipient_type).maybe(included_in?: %w[Profile ProfileGroup Channel])
            required(:recipient_id).maybe
            required(:text).filled
            required(:transports).schema do
              optional(:apns).schema do
                required(:apns_app).filled(:int?)
              end

              optional(:action_cable).schema do
              end

              optional(:pubnub).schema do
              end
            end
            optional(:meta).maybe(:hash?)

            validate(recipient_id: %i[
              recipient_type
              recipient_id
            ]) do |recipient_type, recipient_id|
              (!recipient_type && !recipient_id) ||
                "::#{recipient_type}".constantize.exists?(id: recipient_id)
            end
          end

          def recipient_type=(val)
            super val&.camelcase
          end
        end
      end
    end
  end
end
