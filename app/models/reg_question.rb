class RegQuestion < ActiveRecord::Base

  def self.random_question
    rand_id = rand(self.count)
    self.first(:conditions => [ "id >= ?", rand_id])
  end
end
