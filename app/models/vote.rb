class Vote < ActiveRecord::Base

  belongs_to :mugshot, counter_cache: :vote_count

  belongs_to :user

  validates :mugshot_id, presence: true
  validates :user_id, presence: true
end
