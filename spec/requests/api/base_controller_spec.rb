require "rails_helper"

RSpec.describe Api::BaseController, type: :request do
  it "returns unauthorized if token is invalid" do
    get "/api/v1/site", headers: {Authorization: "token 1234abc"}
    expect(response).to have_http_status(:unauthorized)
  end

  it "returns 200 if token is valid" do
    api_token = create_valid_api_token
    get "/api/v1/site", headers: {Authorization: "token #{api_token.token}"}
    expect(response).to have_http_status(:ok)
  end

  it "updates last_used_at for a valid token" do
    api_token = create_valid_api_token

    expect(api_token.last_used_at).to be_nil

    get "/api/v1/site", headers: {Authorization: "token #{api_token.token}"}

    expect(api_token.reload.last_used_at).not_to be_nil
  end

  def create_valid_api_token
    account = Account.create!
    site = Site.create!(account:)
    site.api_tokens.create!(name: "name")
  end
end
