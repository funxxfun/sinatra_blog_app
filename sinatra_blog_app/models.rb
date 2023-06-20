class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body
  belongs_to :user
  has_many :likes
end

class User < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :password, :maxmum => 10, :minimum => 4
  has_many :posts
  has_many :likes
end

class Task < ActiveRecord::Base
end

class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end

class Category < ActiveRecord::Base
end