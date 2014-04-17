class Mugshot < ActiveRecord::Base
  belongs_to :user
  has_many :comments,
    dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def full_name
    first_name << ' ' << last_name
  end
end
