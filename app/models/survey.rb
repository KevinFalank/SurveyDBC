class Survey < ActiveRecord::Base
  belongs_to :user, :foreign_key => "users_id"
  has_many :participants
  has_many :questions
  has_many :users, :through => :participants
end
