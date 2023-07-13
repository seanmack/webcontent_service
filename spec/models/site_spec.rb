require "rails_helper"

RSpec.describe Site, type: :model do
  it { should belong_to(:account) }
  it { should have_many(:pages) }

  it "is destroyed when parent account is destroyed" do
    account = Account.create!
    site = account.sites.create!

    Account.delete_all

    expect { Site.find(site.id) }.to raise_exception(ActiveRecord::RecordNotFound)
  end
end
