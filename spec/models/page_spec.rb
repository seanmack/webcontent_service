require "rails_helper"

RSpec.describe Page, type: :model do
  it { should belong_to(:account) }
  it { should belong_to(:site) }
end
