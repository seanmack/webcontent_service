require "rails_helper"

RSpec.describe Api::V1::SiteController, type: :request do
  it "returns site details" do
    account = Account.create!
    site = Site.create!(account:, settings: {a: 1})
    api_token = site.api_tokens.create!(name: "name")

    get "/api/v1/site", headers: {Authorization: "token #{api_token.token}"}

    expect(response).to have_http_status(:ok)
    expect(response.parsed_body["id"]).to eq(site.id)
    expect(response.parsed_body["account_id"]).to eq(account.id)
    expect(response.parsed_body["settings"]).to eq({"a" => 1})
    expect(response.parsed_body["created_at"]).not_to be_nil
    expect(response.parsed_body["updated_at"]).not_to be_nil
  end
end
