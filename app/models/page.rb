class Page < ApplicationRecord
  belongs_to :site
  belongs_to :account
end
