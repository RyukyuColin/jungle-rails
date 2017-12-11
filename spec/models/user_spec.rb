require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid with all fields given' do
      @user = User.new({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(@user).to be_valid
    end
    it 'should not be valid with a missing first_name' do
      @user = User.new({
        first_name: nil,
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(@user).to_not be_valid
    end
    it 'should not be valid with a missing last_name' do
      @user = User.new({
        first_name: 'Bob',
        last_name: nil,
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(@user).to_not be_valid
    end
    it 'should not be valid with a missing email' do
      @user = User.new({
        first_name: 'Bob',
        last_name: 'Robert',
        email: nil,
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(@user).to_not be_valid
    end
    it 'should not be valid with a missing password' do
      @user = User.new({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: nil,
        password_confirmation: nil
      })
      expect(@user).to_not be_valid
    end
    it 'should not be valid with different passwords' do
      @user = User.new({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc54321'
      })
      expect(@user).to_not be_valid
    end
    it 'should not be valid with a missing password_confirmation' do
      @user = User.create({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: nil
      })
      expect(@user).to_not be_valid
    end
    it 'should not be valid with an already given email' do
      @user1 = User.create!({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      @user2 = User.new({
        first_name: 'Robert',
        last_name: 'Bobbings',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end
    it 'should not be valid with an already given email in different case' do
      @user1 = User.create!({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      @user2 = User.new({
        first_name: 'Robert',
        last_name: 'Bobbings',
        email: 'BOB@bob.Com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end
     it 'should not be valid with a password length less than 8' do
      @user = User.new({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc123',
        password_confirmation: 'abc123'
      })
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should be valid if user is a valid user' do
      @user = User.create!({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eql(@user)
    end
    it 'should return nil if email is invalid' do
      @user = User.create!({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(User.authenticate_with_credentials('abc@gmail.com', @user.password)).to be_nil
    end
    it 'should return nil if password is invalid' do
      @user = User.create!({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(User.authenticate_with_credentials(@user.email, 'abc123')).to be_nil
    end
    it 'should be valid if the email has whitespace' do
      @user = User.create!({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'bob@bob.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(User.authenticate_with_credentials('  bob@bob.com', @user.password)).to eql(@user)
    end
    it 'should be valid if email is the wrong case' do
      @user = User.create!({
        first_name: 'Bob',
        last_name: 'Robert',
        email: 'Bob@bOb.com',
        password: 'abc12345',
        password_confirmation: 'abc12345'
      })
      expect(User.authenticate_with_credentials('BOB@bob.COM', @user.password)).to eql(@user)
    end
  end
end
