class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :mugshot

  validates :title, presence: {message: "Opps.. forgot the title"}
  validates :description, presence: {message: "Opps.. forgot the description"}
end
