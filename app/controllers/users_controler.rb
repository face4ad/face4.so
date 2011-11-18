# encoding: UTF-8
class UsersController < ApplicationController

  # show singup form, after the user login from sina.
  #/users/signup
  def signup 
    render :signup 
  end

end
