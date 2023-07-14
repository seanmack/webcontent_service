class Site < ApplicationRecord
  belongs_to :account
  has_many :pages
  has_many :api_tokens
end
