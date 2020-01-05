require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){FactoryBot.build(:user)}

  it 'should be valid' do
    expect(user.valid?).to eq(true)
  end

  describe 'name test' do

    it 'when name is empty then invalid' do
      user.name = ''
      expect(user.valid?).to eq(false)
    end

    it 'when name is over 50 letters then invalid' do
      user.name = 'a'*51
      expect(user.valid?).to eq(false)
    end
  
  
  end

  describe 'email test' do
    it 'when email is empty then invalid' do
      user.email = ''
      expect(user.valid?).to eq(false)
    end
  
    it 'when email is over 255 letters then invalid' do
      user.email = "a" * 244 + "@example.com"
      expect(user.valid?).to eq(false)
    end
  
    it 'when email is formatted then valid' do
      user.email = 'test@valid.co.jk.kon'
      expect(user.valid?).to eq(true)
    end
  
    it 'when email is unformatted then invalid' do
      user.email = 'unvalid_email'
      expect(user.valid?).to eq(false)
    end
  
    it 'when email is already exist then invalid' do
      user.save
      new_user = FactoryBot.build(:user)
      new_user.name = 'test_new_name'
      expect(new_user.valid?).to eq(false)
    end
  end

  describe 'password test' do
    it 'when password is empty then invalid' do
      user.password = user.password_confirmation = ''
      expect(user.valid?).to eq(false)
    end

    it 'when password is less than 6 letters then invalid' do
      user.password = user.password_confirmation = 'a'*5
      expect(user.valid?).to eq(false)
    end
  end
end
