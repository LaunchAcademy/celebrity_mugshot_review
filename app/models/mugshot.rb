class Mugshot < ActiveRecord::Base
  belongs_to :user
  has_many :comments,
    dependent: :destroy
  has_many :votes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  paginates_per 50

  def full_name
    [first_name , ' ', last_name].join
  end

  def has_vote_from?(user)
    return false if user.nil?

    self.votes.where(user_id: user.id).any?
  end

  def vote_from(user)
    self.votes.where(user_id: user.id).first
  end
end
