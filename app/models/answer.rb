class Answer < ActiveRecord::Base
  belongs_to :question, :counter_cache => true
  belongs_to :user, :counter_cache => true
  validates_presence_of :question
  validates_presence_of :user
end
