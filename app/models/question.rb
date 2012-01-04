class Question < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  has_many :answers
  acts_as_taggable
end
