require 'spec_helper'

describe User do
   context "when creating an empty user that you don't want to insert into the database yet" do
    it "use User.new()" do
      
      user = User.new()

      expect(user.id).to eql(nil)
      expect(user.username).to eql(nil)
      expect(user.password_hash).to eql(nil)
      expect(User.all.length).to eql(1)

    end     
  end

end
