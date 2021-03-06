# frozen_string_literal: true

module API
  module V1
    module Notification
      module Decorator
        class Collection < Pragma::Decorator::Base
          feature Pragma::Decorator::Collection
          feature Pragma::Decorator::Pagination
          feature Pragma::Decorator::Type

          decorate_with Instance
        end
      end
    end
  end
end
