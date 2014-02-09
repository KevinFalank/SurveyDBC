require_relative "spec_helper"

describe "Tara has trouble breaking down the basics" do
  context "when creating a user" do
    it "use User.new" do
      
      user = User.new()

      expect(user).to eql(true)
    end    
  end
end