class Like < ActiveRecord::Base
  belongs_to :pioneertype, counter_cache: :likes_count
  belongs_to :user
end
