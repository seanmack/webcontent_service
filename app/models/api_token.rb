class ApiToken < ApplicationRecord
  belongs_to :site, dependent: :destroy

  validates_presence_of :name

  has_secure_token :token
end
