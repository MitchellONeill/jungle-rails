require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    marc = User.create(
        first_name: 'Marcus'
        last_name: 'Stroman',
        email: "marcstro@bluejays.com",
        password: 'password',
        password_confirmation: 'password')

    it 'should have a first_name' do
      user = User.create(
        last_name: 'Stroman',
        email: "marcstro@bluejays.com",
        password: 'password',
        password_confirmation: 'password')
      expect(user.valid?).to be false
      expect(user.errors.full_messages).to include ("First name can't be blank")
    end

    it 'should have equivalent password and confirmations' do
      user = User.create(first_name: 'Marcus', last_name: 'Stroman', email: "marcstro@bluejays.com", password: 'password', password_confirmation: 'wrongone')
      expect(user.valid?).to be false
    end

    it 'should have a unique email' do
      user = User.create(first_name: 'Marcus', last_name: 'Stroman',
        email: "marcstro@bluejays.com", password: 'password', password_confirmation: 'password')
      user2 = User.create(first_name: 'Marc', last_name: 'Stromano',
        email: "marcstro@bluejays.com", password: 'password', password_confirmation: 'password')
      user3 = User.create(first_name: 'Marc', last_name: 'Stromano',
        email: "MARCstro@bluejays.com", password: 'password', password_confirmation: 'password')
      user.save
      expect(user2.valid?).to be false
      expect(user3.valid?).to be false
      puts user2.errors.full_messages
      puts user3.errors.full_messages
    end

    it 'should trim white spaces' do
      user = User.create(first_name: 'Marcus', last_name: 'Stroman',
      email: 'marcstro@bluejays.com', password: 'password', password_confirmation: 'password')
      user.save
      expect(User.authenticate_with_credentials('  marcstro@bluejays.com  ', 'password')).to eq(user)
    end



  end

end
