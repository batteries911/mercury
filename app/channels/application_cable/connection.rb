# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_profile

    def connect
      self.current_profile = find_current_profile
    end

    private

    def find_current_profile
      token = find_jwt_from_url_or_headers
      return reject_unauthorized_connection unless token

      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.secrets.secret_key_base,
          true,
          algorithm: 'HS256'
        )
      rescue JWT::DecodeError
        return reject_unauthorized_connection
      end

      Profile.find_by(id: decoded_token[0]['sub']) || reject_unauthorized_connection
    end

    def find_jwt_from_url_or_headers
      authorization_header = request.authorization.to_s.split(' ')[1]
      protocol_header = request.headers[:HTTP_SEC_WEBSOCKET_PROTOCOL].to_s.split(',').last.to_s.strip

      if authorization_header.present?
        Base64.decode64(authorization_header)
      elsif protocol_header.present?
        protocol_header
      end
    end
  end
end
