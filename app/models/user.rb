class User < ActiveRecord::Base
  has_many :participants
  has_many :surveys, :through => :participants
end
