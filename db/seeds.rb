# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RegQuestion.create(:body => "How to spell Java?", :answer => "Java", :kind => "java")
RegQuestion.create(:body => "How to spell C++?", :answer => "C++", :kind => "c++")
RegQuestion.create(:body => "How to spell Python?", :answer => "Python", :kind => "python")

1.upto(100) do |counter|
  RegQuestion.create(:body => "What is this number #{counter}?", :answer => counter, :kind => "dummy")
end
