require 'spec_helper'

describe Participant do
  context "Testing Activerecord Associations" do 
    it "belongs to user" do
      jacky = Participant.find_by_id(1)
      expect(jacky.user.username).to eql("jacky")

    end 
  end 
end
