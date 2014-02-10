require 'spec_helper'

describe Question do
  context "Testing Activerecord Associations" do
    it "belongs to survey" do 
      fox = Question.all.first
      expect(fox.survey.title).to eql("Animal Sounds")
    end

    it "has many answers" do 
      fox = Question.all.first
      expect(fox.answers[0].text).to eql('Wa-pa-pa-pa-pa-pa-pa-pow!')
      expect(fox.answers[1].text).to eql('Gering-ding-ding-ding-dingeringeding!')
      expect(fox.answers[2].text).to eql('Hatee-hatee-hatee-ho!')
    end 
  end 
end
