module ActsAsTenant
  extend ActiveSupport::Concern

  included do
    belongs_to :tenant, class_name: 'Tenant', foreign_key: :tenant_id, optional: false
  end
end
