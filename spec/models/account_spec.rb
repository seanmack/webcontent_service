require "rails_helper"

RSpec.describe Account, type: :model do
  it { should have_many(:sites) }
  it { should have_many(:pages) }
end
