require "rails_helper"

RSpec.describe Page, type: :model do
  it { should belong_to(:account) }
  it { should belong_to(:site) }

  it "is destroyed when parent site is destroyed" do
    account = Account.create!
    site = Site.create(account:)
    page = Page.create(account:, site:)

    Site.delete_all

    expect { Page.find(page.id) }.to raise_exception(ActiveRecord::RecordNotFound)
  end
end
