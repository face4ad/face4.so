# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
root = Category.create! :name => '0'

parent = Category.create! :name => 'Linux', :parent => root
Category.create! :name => 'Environment', :parent => parent
Category.create! :name => 'Vim', :parent => parent
Category.create! :name => 'Shell', :parent => parent

parent = Category.create! :name => 'Ruby on Rails', :parent => root

subparent = Category.create! :name => 'Rails', :parent => parent

Category.create! :name => 'Rails active record', :parent => subparent
Category.create! :name => 'Rails controller', :parent => subparent
Category.create! :name => 'Rails view', :parent => subparent

