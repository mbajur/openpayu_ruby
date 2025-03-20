# -*- encoding : utf-8 -*-
module OpenPayU
  module Models
    class AccessToken < Model
      attr_accessor :access_token, :token_type, :expires_in, :grant_type
      validates :access_token, :token_type, :expires_in, :grant_type, presence: true
    end
  end
end
