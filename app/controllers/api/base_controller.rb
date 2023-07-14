class Api::BaseController < ApplicationController
  prepend_before_action :authenticate_api_token!

  private

  def authenticate_api_token!
    @site = site_from_token
    return head :unauthorized if !@site
  end

  def token_from_header
    request.headers.fetch("Authorization", "").split(" ").last
  end

  def api_token
    @_api_token ||= ApiToken.find_by(token: token_from_header)
  end

  def site_from_token
    if api_token.present?
      api_token.touch(:last_used_at)
      api_token.site
    end
  end
end
