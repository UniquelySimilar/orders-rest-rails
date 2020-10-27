class UserWithToken < ApplicationRecord
  has_secure_password
  self.table_name = "tokenusersrails"
end
