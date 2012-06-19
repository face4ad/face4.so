class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  
  has_many :categories
  has_many :posts

  #Create default root category if not found
  #Use the user id as the category name, e.g. User: Peter Chan, id: 33, then the Cateory.id = 33
  def get_or_create_root_cat
    if self.categories.root.blank?
      root_cat = self.categories.build(:name => self.id)
      root_cat.save
    else
      root_cat = self.categories.root.first
    end
  end
end
