require 'spec_helper'

describe User do
   context "when creating a user" do
    it "use User.new" do
      
      user = User.new()

      expect(user.id).to eql(nil)
    end    
  end

  pending "add some examples to (or delete) /Users/tlroys/Desktop/SurveyDBCGroupProject/Rakefile"
end
