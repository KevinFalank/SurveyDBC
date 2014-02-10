require 'spec_helper'

describe Answer do
  context "Testing Activerecord Associations" do
    it "belongs to question" do 
      fox_say = Answer.all.first
      expect(fox_say.question.text).to eql("What does the Fox say?")
    end 

    it "has many results" do 
      fox_say = Answer.all.first
      expect(fox_say.results).not_to eql(0)
    end



  end 
end
