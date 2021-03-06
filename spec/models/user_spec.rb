require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
    
    it 'should be created with a password and password confirmation' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
    end  
    
    it 'should be successful with the password and password confirmation match' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(@user.password).to eql(@user.password_confirmation)
    end
    
    it 'should output an error message if the password and confirmation do not match' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "4567")
      @user.save
      #code does not currently throw an exception or error message it just re-directs to sign up
      #this follows compass but not great UI
      expect(@user.errors.full_messages).to_not be_empty
    end

    it 'should be created with a name' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(@user.name).to be_present
    end

    it 'should be created with an email' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(@user.email).to be_present
    end  
    
    it 'should fail and throw an error message if the name is blank' do
      @user = User.new(name: "", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(@user.errors.full_messages).to_not be_empty
    end  
    
    it 'should have a unique email address' do
      @user1 = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user1.save
      @user2 = User.new(name: "Jane Doe", email: "J@GMAIL.COM", password: "1234", password_confirmation: "1234")
      @user2.save
      expect(@user2.errors.full_messages).to_not be_empty
    end
    
    it 'should give an error when the password length is less than 4 characters' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "123", password_confirmation: "123")
      @user.save
      expect(@user.errors.full_messages).to_not be_empty
    end
  end
  
  describe ".authenticate_by_user" do
    
    it 'should authenticate with the correct email and password' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      authentication = User.authenticate_with_credentials(@user.email, @user.password)
      #checks that they are the same user in the database based on the user id
      expect(authentication.id).to eql(@user.id)
    end
    
    it 'should not authenticate with the incorrect password' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      authentication = User.authenticate_with_credentials(@user.email, "abcd")
      expect(authentication).to be nil
    end
    
    it 'should authenticate an email with white space before the email address' do
      @user = User.new(name: "John Doe", email: "j@gmail.com", password: "1234", password_confirmation: "1234")
      @user.save
      authentication = User.authenticate_with_credentials("  #{@user.email}", @user.password)
      expect(authentication.id).to eql(@user.id)
    end
    
    it 'should authenticate an email regardless of case' do
      @user = User.new(name: "John Doe", email: "J@GmAiL.cOm", password: "1234", password_confirmation: "1234")
      @user.save
      authentication = User.authenticate_with_credentials("j@gmail.com", @user.password)
      expect(authentication.id).to eql(@user.id)
    end

  end
end
