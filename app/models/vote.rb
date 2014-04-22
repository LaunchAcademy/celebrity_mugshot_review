class Vote < ActiveRecord::Base

  belongs_to :mugshot, counter_cache: true

  belongs_to :user

  validates :mugshot, presence: true
  validates :user, presence: true
end
