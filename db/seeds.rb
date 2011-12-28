require 'random_data'

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

user = User.new(:name => "Michael", :email => "michael@dummy.com", :sina_id => 111, :sina_name => "Micael Jordan", :password => "password")
if not user.save!
  p user.errors
  p "error can not save usr"
end
1.upto(35) do |i|
  user.questions.create(:title => Random.paragraphs(1), :body => Random.paragraphs(2), :tag_list => [Random.country,Random.country,Random.country].join(","))
end

#Generate questions with specified tags to test tags feature
1.upto(30) do 
  user.questions.create(:title => Random.paragraphs(1), :body => Random.paragraphs(2), :tag_list => ["Apple",Random.country,Random.country].join(","))
  user.questions.create(:title => Random.paragraphs(1), :body => Random.paragraphs(2), :tag_list => ["Orange",Random.country,Random.country].join(","))
end
