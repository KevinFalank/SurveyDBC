require 'spec_helper'

describe Survey do
  describe "associations" do
    context "testing my understanding of Activerecord associations" do
      it "belongs to a user" do
        animal_sounds = Survey.find_by_title("Animal Sounds")
        expect(animal_sounds.user.username).to eql("jacky")
      end

      it "has many participants" do 
        animal_sounds = Survey.find_by_title("Animal Sounds")
        expect(animal_sounds.participants.length).not_to eql(0); 
      end 

      it "has many questions" do
        animal_sounds = Survey.find_by_title("Animal Sounds")
        expect(animal_sounds.questions.length).to eql(2)
      end 

      xit "has many users who took the survey(Has many users through participants)" do 
        animal_sounds = Survey.find_by_title("Animal Sounds")
        expect(animal_sounds.users.length).to eql(101) 
      end

    end
  end

  pending "tests for validations are not written. Nor are the validations" do

  end

end
