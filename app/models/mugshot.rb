class Mugshot < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    first_name << ' ' << last_name
  end
end
