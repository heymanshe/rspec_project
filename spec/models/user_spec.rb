require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is valid with valid attributes' do
    user = build(:user)
    expect(user).to be_valid
  end
  
  describe 'validations' do
    it 'is invalid without a name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it 'is invalid without an age' do
      user = build(:user, age: nil)
      expect(user).not_to be_valid
      expect(user.errors[:age]).to include("can't be blank")
    end
  end

  describe 'email uniqueness' do
    it 'requires unique emails' do
      create(:user, email: 'test@example.com')
      user = build(:user, email: 'test@example.com')

      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end
  end

  describe 'numericality' do
    it 'requires age to be a number' do
      user = build(:user, age: 'twenty')
      expect(user).not_to be_valid
      expect(user.errors[:age]).to include("is not a number")
    end
    
    it 'requires age to be greater than 18' do
      user = build(:user, age: 17)
      expect(user).not_to be_valid
      expect(user.errors[:age]).to include("must be greater than 18")
    end

    it 'requires age to be less than 65' do
      user = build(:user, age: 66)
      expect(user).not_to be_valid
      expect(user.errors[:age]).to include("must be less than 65")
    end
  end
end