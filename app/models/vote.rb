class Vote < ActiveRecord::Base

  belongs_to :mugshot, counter_cache: :vote_count

  belongs_to :user

  validates :mugshot, presence: true
  validates :user, presence: true
end
