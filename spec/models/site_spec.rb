require "rails_helper"

RSpec.describe Site, type: :model do
  it { should belong_to(:account) }
  it { should have_many(:pages) }
end
