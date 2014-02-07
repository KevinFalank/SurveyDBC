class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :results
  has_many :answers, :through => :results
end
