class Category < ActiveRecord::Base
  attr_accessible :name, :parent, :user, :category
  has_many :posts
  has_ancestry
  belongs_to :category
  belongs_to :user

  scope :root, where("ancestry is null")
end
