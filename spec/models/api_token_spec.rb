require "rails_helper"

RSpec.describe ApiToken, type: :model do
  it { should belong_to(:site).dependent(:destroy) }
  it { should have_secure_token(:token) }
  it { should validate_presence_of(:name) }
end
