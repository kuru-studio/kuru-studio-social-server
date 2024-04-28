class Tenant < ApplicationRecord
  encrypts :api_key
end
