class Account < ApplicationRecord
  has_many :sites
  has_many :pages
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
