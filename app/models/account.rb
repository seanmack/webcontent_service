class Account < ApplicationRecord
  has_many :sites
  has_many :pages
end
