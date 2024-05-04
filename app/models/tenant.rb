class Tenant < ApplicationRecord
  has_many :users
  has_many :posts
  has_many :comments

  %w(shop social forum).each do |feature|
    define_method("is_#{feature}_enabled?") do
      included_features.include?(feature)
    end

    define_method("toggle_#{feature}_status!") do
      if send("is_#{feature}_enabled?")
        included_features.delete(feature)
      else
        included_features << feature
      end
      save
    end
  end
end
