require 'spec_helper'

describe Result do
  context "Testing Activerecord Associations" do
    it "belongs to participant" do
      jackys_first_answer = Result.where('id =?', 1).first
      expect(jackys_first_answer.participant.user.username).to eql('jacky') 
    end  
    it "belongs to answer" do 
     jackys_first_answer = Result.where('id =?', 1).first
     expect(jackys_first_answer.answer.text).to eql('Wa-pa-pa-pa-pa-pa-pa-pow!')
    end
  end  
end
