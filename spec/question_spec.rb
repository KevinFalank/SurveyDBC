require 'spec_helper'

describe Question do
  context "Testing Activerecord Associations" do
    it "belongs to survey" do 
      fox = Question.all.first
      expect(fox.survey.title).to eql("Animal Sounds")
    end
  end 
end
