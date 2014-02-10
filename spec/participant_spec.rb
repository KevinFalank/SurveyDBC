require 'spec_helper'

describe Participant do
  context "Testing Activerecord Associations" do 
    it "belongs to user" do
      jacky = Participant.find_by_id(1)
      expect(jacky.user.username).to eql("jacky")
    end 

    it "belongs to survey" do 
      jacky = Participant.find_by_id(1)
      expect(jacky.survey.title).to eql("Animal Sounds")
    end 

    it "has many resutls" do
      jacky = Participant.find_by_id(1)
      expect(jacky.results.length).to eql(2) 
    end 
  end 
end
