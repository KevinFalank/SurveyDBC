require 'spec_helper'

describe User do
  describe "User methods" do
     context "when creating an empty user that you don't want to insert into the database yet" do
      it "use User.new()" do
        
        user = User.new()

        expect(user.id).to eql(nil)
        expect(user.username).to eql(nil)
        expect(user.password_hash).to eql(nil)
        expect(User.all.length).to eql(1)

      end     
    end

    context "When creating a user with a name(more generally, creating a new object using parameters)" do
      it "use four ways to set values creating a new user" do
        
        tara = User.new(username: "Tara")
        expect(tara.username).to eql("Tara")

        kori = User.new({username: "Kori"})
        expect(kori.username).to eql("Kori")

        steven = User.new
        steven.username = "Steven"
        expect(steven.username).to eql("Steven")

        carolyn = User.new do |c|
          c.username = "Carolyn"
        end
        expect(carolyn.username).to eql("Carolyn")

      end
    end 

    context "When creating a password for a user that doesn't already have one" do
      it "use bcrypt " do
        tara = User.new(username: "Tara") #create a new user
        expect(tara.password_hash).to eql(nil)
        tara.password = "password" #create an encrypted password for a user
        expect(tara.password_hash).not_to eql(nil)

      end 
    end 

    context "When trying to log a user in," do
      it "use the User.authenticate method." do
        jacky = User.authenticate('jacky', 'password')

        expect(jacky.username).to eql("jacky")

      end
    end

    context "When checking to see what the password is," do
      it "uses the password accessor method" do
        #Something seems wrong with the Password.new method. let us test this. 
        jacky = User.find_by_username('jacky')
        expect(jacky.password).to eql('$2a$10$/oRbeA9fw240CEEbpftN4.JDCXNI26t.MQN2YqVDbDQuOxvnF1gRi')
      end
    end 
  end


end
