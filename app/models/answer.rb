class Answer < ActiveRecord::Base
  has_many :comments
  belongs_to :question, :counter_cache => true
  belongs_to :user, :counter_cache => true
  validates_presence_of :question
  validates_presence_of :user
end
