require "rails_helper"

RSpec.describe Site, type: :model do
  it { should belong_to(:account) }
  it { should have_many(:pages) }
  it { should have_many(:api_tokens) }

  it "is destroyed when parent account is destroyed" do
    site = create_site
    Account.delete_all # bypass AR callbacks
    expect { Site.find(site.id) }.to raise_exception(ActiveRecord::RecordNotFound)
  end

  it "allows me to store arbitrary settings" do
    site = create_site
    expect(site.settings).to eq({})
    site.update(settings: {field: "value"})
    expect(site.reload.settings["field"]).to eq("value")
  end

  def create_site
    account = Account.create!
    account.sites.create!
  end
end
