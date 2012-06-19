class Post < ActiveRecord::Base
  attr_accessible :body, :title, :category_id
  belongs_to :category, :counter_cache => true
  belongs_to :user
end
