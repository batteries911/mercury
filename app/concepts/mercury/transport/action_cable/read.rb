# frozen_string_literal: true

module Mercury
  module Transport
    module ActionCable
      class Read < Trailblazer::Operation
        extend Contract::DSL

        contract 'params', (Dry::Validation.Schema do
          required(:data).schema do
          end
        end)

        step Contract::Validate(name: 'params')
        step :handle!

        def handle!(params:, current_profile:, **)
          BunnyClient.publish(
            transport: :action_cable,
            message_name: params[:data].with_indifferent_access[:action],
            data: params[:data],
            profile: current_profile.id
          )
        end
      end
    end
  end
end
