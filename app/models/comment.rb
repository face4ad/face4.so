class Comment < ActiveRecord::Base
  belongs_to :question, :counter_cache => true
  belongs_to :user, :counter_cache => true
  belongs_to :answer, :counter_cache => true
  validates_presence_of :user
  validates_presence_of :answer
  validates_presence_of :question
end
