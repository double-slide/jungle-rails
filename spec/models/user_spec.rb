require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create({
      :name => "first last",
      :email => "first.last@email.com",
      :password => "password",
      :password_confirmation => "password"
    })  
  end


  describe 'Validations' do

    it "returns true if user creation is valid " do
      expect(@user).to be_valid
    end

    it "returns false if created user email is not valid" do
      @user.email = nil
      expect(@user.valid?).to be_falsey
    end

    it "returns false if created user name is not valid" do
      @user.name = nil
      expect(@user.valid?).to be_falsey
    end

    it "returns false if email already exists in database" do
      @second_user = User.create({
        :name => "first last",
        :email => "first.last@email.com",
        :password => "password",
        :password_confirmation => "password"  
      })
      expect(@second_user.valid?).to be_falsey
    end

    it "returns true if email does not already exist" do
      @third_user = User.create({
        :name => "first3 last3",
        :email => "first3.last3@email.com",
        :password => "password",
        :password_confirmation => "password"  
      })
      expect(@third_user.valid?).to be_truthy
    end

    it "returns false if email (OTHER CASE) already exists in database" do
      @second_user = User.create({
        :name => "first last",
        :email => "FIRST.LAST@email.com",
        :password => "password",
        :password_confirmation => "password"  
      })
      expect(@second_user.valid?).to be_falsey
    end

  end


  describe ".authenticate_with_credentials" do

    it 'authenticates with valid email and password' do
      @user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user).to_not be(nil)
    end

    it 'authenticates with valid email and invalid password' do
      @user = User.authenticate_with_credentials(@user.email, "badPassword")
      expect(@user).to be(nil)
    end

    it 'authenticates with invalid email and valid password' do
      @user = User.authenticate_with_credentials("badEmail", @user.password)
      expect(@user).to be(nil)
    end

    it 'authenticates with valid email INCLUDING WHITESPACE and valid password' do
      @user = User.authenticate_with_credentials("    first.last@email.com     ", @user.password)
      expect(@user).to_not be(nil)
    end

    it 'authenticates with valid email (OTHER CASE) and password' do
      @user = User.authenticate_with_credentials("FIRST.LAST@email.com", @user.password)
      expect(@user).to_not be(nil)
    end

  end

end
