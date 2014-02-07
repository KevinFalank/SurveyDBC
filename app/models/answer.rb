class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :results
  has_many :participants, :through => :results
end
