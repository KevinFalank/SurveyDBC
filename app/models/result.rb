class Result < ActiveRecord::Base
  belongs_to :participant
  belongs_to :answer
end
